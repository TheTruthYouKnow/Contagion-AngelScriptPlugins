//当插件加载时候的函数
void OnPluginInit(){
  PluginData::SetName( "插件名字" );
  PluginData::SetAuthor( "插件作者" );
  PluginData::SetVersion( "插件版本号" );
  //插件载入时候
  Chat.PrintToChat(all, "服务器已开启插件");
}

void OnPluginUnload(){
  //卸载插件时候
  Chat.PrintToChat(all, "服务器已关闭插件");
}
