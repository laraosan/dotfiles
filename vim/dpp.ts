import { BaseConfig, type ConfigArguments, type ConfigReturn } from "jsr:@shougo/dpp-vim/config";
import { type Plugin } from "jsr:@shougo/dpp-vim/types";

export class Config extends BaseConfig {
	override async config(args: ConfigArguments): Promise<ConfigReturn> {
		args.contextBuilder.setGlobal({
			protocols: ["git"]
		});

		type Toml = {
			hooks_file?: string;
			ftplugins?: Record<string, string>;
			plugins?: Plugin[];
		};

		const [context, options] = await args.contextBuilder.get(args.denops);

		const toml: Toml = await args.dpp.extAction(
			args.denops,
			context,
			options,
			"toml",
			"load",
			{
				path: "~/.config/vim/plugins.toml",
			},
		) as Toml;

		console.log(toml.plugins)
		
		return {
			plugins: toml.plugins,
		};
	}
}
