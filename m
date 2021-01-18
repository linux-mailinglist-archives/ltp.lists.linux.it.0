Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5802F9C0F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 10:55:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8ED843C30F8
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 10:55:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 502DA3C2A87
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 10:55:29 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E028E60004F
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 10:55:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="103579660"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Jan 2021 17:55:25 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id E36424CE6020;
 Mon, 18 Jan 2021 17:55:19 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 18 Jan 2021 17:55:22 +0800
Message-ID: <60055B2C.1080607@cn.fujitsu.com>
Date: Mon, 18 Jan 2021 17:55:56 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210118081350.21418-1-pvorel@suse.cz>
In-Reply-To: <20210118081350.21418-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: E36424CE6020.AB9D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] travis: Temporary workaround for pull rate
 limit
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr
I think using gcr.io mirror as a temporary solution is OK. But why we
not migrate into Github Actions directly? Now, it is time to this
release and do we should apply it before release?

Best Regards
Yang Xu
> Use mirror.gcr.io mirror to temporary workaround pull rate limit in
> docker registry. Correct solution is to migrate to Github Actions.
> 
> See also: #761
> 
> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
> Hi,
> 
> not a final solution for #761, just to get Travis quickly working.
> 
> Kind regards,
> Petr
> 
>   .travis.yml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/.travis.yml b/.travis.yml
> index edf627c33..245b790de 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -85,6 +85,14 @@ matrix:
> 
>   before_install:
>       - df -hT
> +    # pull rate limit workaround
> +    - tmpdaemon=$(mktemp)
> +    - sudo jq '."registry-mirrors" += ["https://mirror.gcr.io"]' /etc/docker/daemon.json>  $tmpdaemon
> +    - sudo mv $tmpdaemon /etc/docker/daemon.json
> +    - sudo systemctl daemon-reload
> +    - sudo systemctl restart docker
> +    - docker system info
> +    # ltp
>       - DIR="/usr/src/ltp"
>       - printf "FROM $DISTRO\nRUN mkdir -p $DIR\nWORKDIR $DIR\nCOPY . $DIR\n">  Dockerfile
>       - cat Dockerfile




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
