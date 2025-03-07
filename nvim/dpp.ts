import { BaseConfig, type ConfigArguments, type ConfigReturn } from "jsr:@shougo/dpp-vim/config";
import { type Plugin } from "jsr:@shougo/dpp-vim/types";
import { type Toml } from "jsr:@shougo/dpp-ext-toml";

export class Config extends BaseConfig {
	override async config(args: ConfigArguments): Promise<ConfigReturn> {
		args.contextBuilder.setGlobal({
			protocols: ["git"]
		});

		const [context, options] = await args.contextBuilder.get(args.denops);

		const toml: Toml = await args.dpp.extAction(
			args.denops,
			context,
			options,
			"toml",
			"load",
			{
				path: "~/.config/nvim/plugins.toml",
			},
		) as Toml;

		return {
			plugins: toml.plugins,
			ftplugins: toml.ftplugins,
			hooks_file: toml.hooks_file,
			multiple_hooks: toml.multiple_hooks,
		};
	}
}
