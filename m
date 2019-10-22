Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1803E0AEE
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 19:45:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E6EE3C1CFD
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 19:45:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 872653C1CFD
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 19:45:07 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2BFE41A00936
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 19:45:00 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=calabresa)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1iMyDK-0002qS-8V; Tue, 22 Oct 2019 17:44:58 +0000
Date: Tue, 22 Oct 2019 14:44:53 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20191022174452.GB4055@calabresa>
References: <20191022025456.15711-1-ice_yangxiao@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022025456.15711-1-ice_yangxiao@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/binfmt_misc02.sh: Fix local variable
 assignment for dash
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: limingyu <limingyu@deepin.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Oct 22, 2019 at 10:54:56AM +0800, Xiao Yang wrote:
> Only the first one can be accepted if more than one string are assigned
> to local valiable.  For example, only "This" is assigned to $string:
> ------------------------------------
> tstring="This is test for extension"
> ...
> local string=$tstring
> ------------------------------------
> 
> We add a pair of quotes to fix the issue now. Besides we can also fix
> the issue by splitting declaration and assignment(e.g. local string &
> string=$tstring).
> 
> See the explanation from:
> https://wiki.ubuntu.com/DashAsBinSh#local
> 
> Fixes: #601
> Reported-by: limingyu <limingyu@deepin.com>
> Suggested-by: limingyu <limingyu@deepin.com>
> Signed-off-by: Xiao Yang <ice_yangxiao@163.com>

This fixes a problem we have been seeing.

Tested-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

> ---
>  testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
> index 8d0ecd895..9dbcd68cc 100755
> --- a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
> +++ b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
> @@ -26,7 +26,7 @@ TST_NEEDS_CMDS="which cat head"
>  recognised_unrecognised()
>  {
>  	local file=$1
> -	local string=$2
> +	local string="$2"
>  
>  	eval $file >temp 2>&1
>  	if [ $? -ne 0 ] || ! grep -q "$string" temp; then
> @@ -52,7 +52,7 @@ recognised_unrecognised()
>  unrecognised()
>  {
>  	local file=$1
> -	local string=$2
> +	local string="$2"
>  
>  	eval $file >temp 2>&1
>  	if [ $? -eq 0 ] || grep -q "$string" temp; then
> -- 
> 2.21.0
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
