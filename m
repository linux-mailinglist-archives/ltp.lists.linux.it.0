Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E63369D0
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 02:38:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C26B3C6A26
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 02:38:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4704F3C4B8C
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 02:38:52 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0A2756019AB
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 02:38:51 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AXhM5G64r3in53vHuIwPXwfiBI+orLtY04lQ7?=
 =?us-ascii?q?vn1ZYzY9SL36q+mFmvMH2RjozAsLUHY7ltyafIWGS3XQ9Zl6iLNhW4uKdg/gpW?=
 =?us-ascii?q?euMcVe/ZLvqgeQfBHW2+ZB2c5bH5RWJ8b3CTFB4vrSwA79KNo4xcnCzabAv5a7?=
 =?us-ascii?q?815IbSVHL55t9B14DAHzKCxLbS1LH4AwGpbZxucvnVedUE8aZMi6GXUJNtKrz7?=
 =?us-ascii?q?agqLvcbRELHBIh4gWV5AnYjYLSKQSS3RsVTlp0sNUf2FXC+jaY2oyeqf2hjjfT?=
 =?us-ascii?q?22jPhq45pPLRjvFHBMCKl/EPLCTthguCdO1aKsW/lQFwhvqu5lYsmMTNpBllH/?=
 =?us-ascii?q?0b0QKpQkiF5SH10w2l6isn9mP5oGXo/UfLkIjoQi4gEcpdicZ8ehvd0UApu9Zx?=
 =?us-ascii?q?y8twrhiknqsSHRXdhz78+tSNcxlrk3C/qX0knfVWoGdYVeIlGcJshL1a7EVIC4?=
 =?us-ascii?q?0BAS6/zIgmFdNlBMba6O0TUX7yVQGjglVS?=
X-IronPort-AV: E=Sophos;i="5.81,238,1610380800"; d="scan'208";a="105484462"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Mar 2021 09:38:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 96ABF4CEA98E;
 Thu, 11 Mar 2021 09:38:47 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Mar 2021 09:38:46 +0800
Message-ID: <604974A5.6080604@cn.fujitsu.com>
Date: Thu, 11 Mar 2021 09:38:45 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210308160122.24522-1-pvorel@suse.cz>
 <20210308160122.24522-2-pvorel@suse.cz>
In-Reply-To: <20210308160122.24522-2-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 96ABF4CEA98E.ABABD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] docparse: Unify Description and Algorithm
 titles
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2021/3/9 0:01, Petr Vorel wrote:
> Instead owo'n'df fixing sources docs unify it during doc generation.
Hi Petr,

Your fix unifies Description and Algorithm in metadata.{html, pdf}.
I wonder if we should do the conversion in metadata.json instead.

Best Regards,
Xiao Yang
> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
>   docparse/testinfo.pl | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
> index b5ab02bc1..f3a657d4d 100755
> --- a/docparse/testinfo.pl
> +++ b/docparse/testinfo.pl
> @@ -308,7 +308,7 @@ sub content_all_tests
>
>   				# fix formatting for asciidoc [DOCUMENTATION] =>  *DOCUMENTATION*
>   				if ($doc =~ s/^\[(.*)\]$/$1/) {
> -					$doc = paragraph(bold($doc));
> +					$doc = paragraph(bold(ucfirst(lc($doc))));
>   				}
>
>   				$content .= "$doc\n";




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
