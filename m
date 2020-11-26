Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BCE2C4E2D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 06:16:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C7F63C5E37
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 06:16:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 77BBC3C2CF9
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 06:16:19 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D96AE2003A9
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 06:16:17 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,371,1599494400"; 
 d="scan'208,217";a="101766506"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Nov 2020 13:16:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 959924CE5CDB;
 Thu, 26 Nov 2020 13:16:09 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 26 Nov 2020 13:16:06 +0800
Message-ID: <5FBF3A16.6090101@cn.fujitsu.com>
Date: Thu, 26 Nov 2020 13:16:06 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20201126012838.531070-1-yangx.jy@cn.fujitsu.com>
 <CAEemH2eQNTy9V+NSn+kwV8zZ0BTr+PEHuD_RPhx3Ns1v=+iPNw@mail.gmail.com>
In-Reply-To: <CAEemH2eQNTy9V+NSn+kwV8zZ0BTr+PEHuD_RPhx3Ns1v=+iPNw@mail.gmail.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 959924CE5CDB.AC59E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/name_to_handle_at.h: Fix compiler error on
 centos6
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1278014517=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1278014517==
Content-Type: multipart/alternative;
	boundary="------------000300020506000605070407"

--------------000300020506000605070407
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2020/11/26 12:33, Li Wang wrote:
> Hi Xiao,
>
> The patch itself looks good, but I remember we were planning to 
> drop support for the old distro e.g CentOS6.
>
> The previous discussion here:
> http://lists.linux.it/pipermail/ltp/2020-March/016164.html
Hi Li,

Thanks for sharing the infomation.
When do you plan to remove old distro? next release?

BTW:
It may also resolve the compiler error on uclibc as Fabrice Fontaine 
reported before:
https://github.com/linux-test-project/ltp/commit/cb11e718ce04261cb6ff4c09442b949da33b8797

Best Regards,
Xiao Yang
>
> On Thu, Nov 26, 2020 at 9:49 AM Xiao Yang <yangx.jy@cn.fujitsu.com 
> <mailto:yangx.jy@cn.fujitsu.com>> wrote:
>
>     From travis-ci, compiling name_to_handle_at/open_by_handle_at tests
>     failed on centos6 due to undefined AT_EMPTY_PATH and MAX_HANDLE_SZ.
>
>     Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com
>     <mailto:yangx.jy@cn.fujitsu.com>>
>     ---
>      include/lapi/fcntl.h             | 4 ++++
>      include/lapi/name_to_handle_at.h | 1 +
>      2 files changed, 5 insertions(+)
>
>     diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h
>     index 576a18daf..d6665915f 100644
>     --- a/include/lapi/fcntl.h
>     +++ b/include/lapi/fcntl.h
>     @@ -136,4 +136,8 @@
>      # define SPLICE_F_NONBLOCK 2
>      #endif
>
>     +#ifndef MAX_HANDLE_SZ
>     +# define MAX_HANDLE_SZ 128
>     +#endif
>     +
>      #endif /* __LAPI_FCNTL_H__ */
>     diff --git a/include/lapi/name_to_handle_at.h
>     b/include/lapi/name_to_handle_at.h
>     index c0759c463..3484133d1 100644
>     --- a/include/lapi/name_to_handle_at.h
>     +++ b/include/lapi/name_to_handle_at.h
>     @@ -10,6 +10,7 @@
>      #include <sys/syscall.h>
>      #include "config.h"
>      #include "lapi/syscalls.h"
>     +#include "lapi/fcntl.h"
>      #include "tst_buffers.h"
>      #include "tst_test.h"
>
>     -- 
>     2.25.1
>
>
>
>
>     -- 
>     Mailing list info: https://lists.linux.it/listinfo/ltp
>
>
>
> -- 
> Regards,
> Li Wang




--------------000300020506000605070407
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title></title>
  </head>
  <body bgcolor="#ffffff" text="#000000">
    On 2020/11/26 12:33, Li Wang wrote:
    <blockquote
cite="mid:CAEemH2eQNTy9V+NSn+kwV8zZ0BTr+PEHuD_RPhx3Ns1v=+iPNw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size: small;">Hi Xiao,</div>
          <div class="gmail_default" style="font-size: small;"><br>
          </div>
          <div class="gmail_default" style="font-size: small;">The patch
            itself looks good, but I remember we were planning to
            drop support for the old distro e.g CentOS6. </div>
          <div class="gmail_default" style="font-size: small;"><br>
          </div>
          <div class="gmail_default" style="font-size: small;">The
            previous discussion here:</div>
          <div class="gmail_default" style="font-size: small;"><a
              moz-do-not-send="true"
              href="http://lists.linux.it/pipermail/ltp/2020-March/016164.html">http://lists.linux.it/pipermail/ltp/2020-March/016164.html</a><br>
          </div>
        </div>
      </div>
    </blockquote>
    Hi Li,<br>
    <br>
    Thanks for sharing the infomation.<br>
    When do you plan to remove old distro? next release?<br>
    <br>
    BTW:<br>
    It may also resolve the compiler error on uclibc as Fabrice Fontaine
    reported before:<br>
<a class="moz-txt-link-freetext" href="https://github.com/linux-test-project/ltp/commit/cb11e718ce04261cb6ff4c09442b949da33b8797">https://github.com/linux-test-project/ltp/commit/cb11e718ce04261cb6ff4c09442b949da33b8797</a><br>
    <br>
    Best Regards,<br>
    Xiao Yang<br>
    <blockquote
cite="mid:CAEemH2eQNTy9V+NSn+kwV8zZ0BTr+PEHuD_RPhx3Ns1v=+iPNw@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Nov 26, 2020 at 9:49
            AM Xiao Yang &lt;<a moz-do-not-send="true"
              href="mailto:yangx.jy@cn.fujitsu.com">yangx.jy@cn.fujitsu.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;">From travis-ci, compiling
            name_to_handle_at/open_by_handle_at tests<br>
            failed on centos6 due to undefined AT_EMPTY_PATH and
            MAX_HANDLE_SZ.<br>
            <br>
            Signed-off-by: Xiao Yang &lt;<a moz-do-not-send="true"
              href="mailto:yangx.jy@cn.fujitsu.com" target="_blank">yangx.jy@cn.fujitsu.com</a>&gt;<br>
            ---<br>
             include/lapi/fcntl.h             | 4 ++++<br>
             include/lapi/name_to_handle_at.h | 1 +<br>
             2 files changed, 5 insertions(+)<br>
            <br>
            diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h<br>
            index 576a18daf..d6665915f 100644<br>
            --- a/include/lapi/fcntl.h<br>
            +++ b/include/lapi/fcntl.h<br>
            @@ -136,4 +136,8 @@<br>
             # define SPLICE_F_NONBLOCK 2<br>
             #endif<br>
            <br>
            +#ifndef MAX_HANDLE_SZ<br>
            +# define MAX_HANDLE_SZ 128<br>
            +#endif<br>
            +<br>
             #endif /* __LAPI_FCNTL_H__ */<br>
            diff --git a/include/lapi/name_to_handle_at.h
            b/include/lapi/name_to_handle_at.h<br>
            index c0759c463..3484133d1 100644<br>
            --- a/include/lapi/name_to_handle_at.h<br>
            +++ b/include/lapi/name_to_handle_at.h<br>
            @@ -10,6 +10,7 @@<br>
             #include &lt;sys/syscall.h&gt;<br>
             #include "config.h"<br>
             #include "lapi/syscalls.h"<br>
            +#include "lapi/fcntl.h"<br>
             #include "tst_buffers.h"<br>
             #include "tst_test.h"<br>
            <br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            <br>
            <br>
            -- <br>
            Mailing list info: <a moz-do-not-send="true"
              href="https://lists.linux.it/listinfo/ltp"
              rel="noreferrer" target="_blank">https://lists.linux.it/listinfo/ltp</a><br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">
            <div>Regards,<br>
            </div>
            <div>Li Wang<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000300020506000605070407--

--===============1278014517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1278014517==--
