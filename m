Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC6C10D09A
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 04:20:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83BB73C23FB
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 04:20:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6F56E3C0888
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 04:19:58 +0100 (CET)
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A1DD5601CFE
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 04:19:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=bsy4r
 sxi7x8vjB4Uap+wBrCk/U8AoiVUWNWo+30KTN8=; b=nrE1vxARWFDR9+jsLX8CZ
 CiUfteRBiMr2Als7olhBaFE/J7GJOb4Cr8MjIiDWNMw+BI/9OEZCghiVwvbWfPpo
 6IRrhu9E5oB9Ed5TuBeRhApPHSsoJhiVOTSh5HW1bFReaK906EioXGTmyi8Bgf2X
 LXtpDFigXeA9J+jXWhurG0=
Received: from [192.168.1.133] (unknown [112.25.212.39])
 by smtp10 (Coremail) with SMTP id DsCowADX3alWjuBdQAdnEw--.12S2;
 Fri, 29 Nov 2019 11:19:52 +0800 (CST)
To: Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>
References: <20191128082945.6495-1-liwang@redhat.com>
 <1766813779.14211710.1574930105928.JavaMail.zimbra@redhat.com>
 <CAEemH2cW+XUARCzyreQQgJnd1HSV506JEn4rt=oGyezXRtLKFw@mail.gmail.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <16eba1ee-8b23-13c5-f496-3758c2b29fc8@163.com>
Date: Fri, 29 Nov 2019 11:19:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cW+XUARCzyreQQgJnd1HSV506JEn4rt=oGyezXRtLKFw@mail.gmail.com>
Content-Language: en-US
X-CM-TRANSID: DsCowADX3alWjuBdQAdnEw--.12S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4rtF1kWryxtryDZFWkZwb_yoWkJFc_C3
 W2yrn7W3yjyr1rCa17Ja92vr1SkayxXrWFk3W5Kr1fXa9rGr1xGrsYya1UJw1rWrs5W34S
 kr45JFn0g3y5CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8EfO7UUUUU==
X-Originating-IP: [112.25.212.39]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiOxl8XlXln6j8EwAAso
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED PATCH] mmap1: include lapi/abisize.h header
 file
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
Cc: Zhijun Wang <zhijwang@redhat.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1759122291=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1759122291==
Content-Type: multipart/alternative;
 boundary="------------C9E074A81DF775466AF0E202"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C9E074A81DF775466AF0E202
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/28/19 4:37 PM, Li Wang wrote:
>
>
> On Thu, Nov 28, 2019 at 4:35 PM Jan Stancek <jstancek@redhat.com 
> <mailto:jstancek@redhat.com>> wrote:
>
>
>     ----- Original Message -----
>     > To get rid of this BROK on i686:
>     >  mmap1.c:204: BROK: mmap((nil),2147483648,3,34,-1,0) failed:
>     ENOMEM (12)
>     >
>     > Reported-by: Zhijun Wang <zhijwang@redhat.com
>     <mailto:zhijwang@redhat.com>>
>     > Signed-off-by: Li Wang <liwang@redhat.com
>     <mailto:liwang@redhat.com>>
>     > ---
>     >  testcases/kernel/mem/mtest06/mmap1.c | 1 +
>     >  1 file changed, 1 insertion(+)
>     >
>     > diff --git a/testcases/kernel/mem/mtest06/mmap1.c
>     > b/testcases/kernel/mem/mtest06/mmap1.c
>     > index c5417444f..5c7d3df2f 100644
>     > --- a/testcases/kernel/mem/mtest06/mmap1.c
>     > +++ b/testcases/kernel/mem/mtest06/mmap1.c
>     > @@ -30,6 +30,7 @@
>     >  #include <stdlib.h>
>     >  #include "lapi/abisize.h"
>     >  #include "tst_test.h"
>     > +#include "lapi/abisize.h"
>
>     This sounds familiar:
>       74d9fe32fda9 ("mtest06/mmap1: add missing lapi/abisize.h include")
>
>
> Ah, sorry I was blind for missing this commit. Seems I just git 
> pull&push my patch.

Hi Li,

Perhaps, you should git revert the duplicated patch. :-)

Thanks

Xiao Yang

>
> -- 
> Regards,
> Li Wang
>

--------------C9E074A81DF775466AF0E202
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 11/28/19 4:37 PM, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2cW+XUARCzyreQQgJnd1HSV506JEn4rt=oGyezXRtLKFw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Nov 28, 2019 at 4:35
            PM Jan Stancek &lt;<a href="mailto:jstancek@redhat.com"
              moz-do-not-send="true">jstancek@redhat.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            ----- Original Message -----<br>
            &gt; To get rid of this BROK on i686:<br>
            &gt;  mmap1.c:204: BROK: mmap((nil),2147483648,3,34,-1,0)
            failed: ENOMEM (12)<br>
            &gt; <br>
            &gt; Reported-by: Zhijun Wang &lt;<a
              href="mailto:zhijwang@redhat.com" target="_blank"
              moz-do-not-send="true">zhijwang@redhat.com</a>&gt;<br>
            &gt; Signed-off-by: Li Wang &lt;<a
              href="mailto:liwang@redhat.com" target="_blank"
              moz-do-not-send="true">liwang@redhat.com</a>&gt;<br>
            &gt; ---<br>
            &gt;  testcases/kernel/mem/mtest06/mmap1.c | 1 +<br>
            &gt;  1 file changed, 1 insertion(+)<br>
            &gt; <br>
            &gt; diff --git a/testcases/kernel/mem/mtest06/mmap1.c<br>
            &gt; b/testcases/kernel/mem/mtest06/mmap1.c<br>
            &gt; index c5417444f..5c7d3df2f 100644<br>
            &gt; --- a/testcases/kernel/mem/mtest06/mmap1.c<br>
            &gt; +++ b/testcases/kernel/mem/mtest06/mmap1.c<br>
            &gt; @@ -30,6 +30,7 @@<br>
            &gt;  #include &lt;stdlib.h&gt;<br>
            &gt;  #include "lapi/abisize.h"<br>
            &gt;  #include "tst_test.h"<br>
            &gt; +#include "lapi/abisize.h"<br>
            <br>
            This sounds familiar:<br>
              74d9fe32fda9 ("mtest06/mmap1: add missing lapi/abisize.h
            include")<br>
          </blockquote>
          <div><br>
          </div>
          <div class="gmail_default" style="font-size:small">Ah, sorry I
            was blind for missing this commit. Seems I just git
            pull&amp;push my patch.</div>
        </div>
      </div>
    </blockquote>
    <p>Hi Li,</p>
    <p>Perhaps, you should git revert the duplicated patch. <span
        class="moz-smiley-s1"><span>:-)</span></span><br>
    </p>
    <p>Thanks</p>
    <p>Xiao Yang<br>
    </p>
    <blockquote type="cite"
cite="mid:CAEemH2cW+XUARCzyreQQgJnd1HSV506JEn4rt=oGyezXRtLKFw@mail.gmail.com">
      <div dir="ltr">
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
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C9E074A81DF775466AF0E202--


--===============1759122291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1759122291==--

