Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1E62041E
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 13:09:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F7503EA33E
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 13:09:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DA1A83EA2E0
 for <ltp@lists.linux.it>; Thu, 16 May 2019 13:09:51 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 821461A01CD1
 for <ltp@lists.linux.it>; Thu, 16 May 2019 13:09:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,476,1549900800"; d="scan'208,217";a="63327793"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 May 2019 19:09:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id 99FAA46BA6C2;
 Thu, 16 May 2019 19:09:44 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 16 May 2019 19:09:43 +0800
Message-ID: <5CDD44F6.6090700@cn.fujitsu.com>
Date: Thu, 16 May 2019 19:09:42 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20190516073826.GA14532@dell5510>
 <1051593197.23090826.1557995723298.JavaMail.zimbra@redhat.com>
 <20190516090705.GA21814@rei.lan>
 <CAEemH2dj3Txm=otnF+UEg2eJY70wTC-5tbT2R1VfrB0qAxtqmQ@mail.gmail.com>
In-Reply-To: <CAEemH2dj3Txm=otnF+UEg2eJY70wTC-5tbT2R1VfrB0qAxtqmQ@mail.gmail.com>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 99FAA46BA6C2.A1742
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] Oldest still supported kernel
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1674985585=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1674985585==
Content-Type: multipart/alternative;
	boundary="------------080209070505000304080406"

--------------080209070505000304080406
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi
>
> On Thu, May 16, 2019 at 5:07 PM Cyril Hrubis <chrubis@suse.cz 
> <mailto:chrubis@suse.cz>> wrote:
>
>     Hi!
>     > > Is it the oldest version we want to support or even something
>     older?
>     >
>     > I'd like minimum to be at least 3.10.0 / glibc-2.17 (RHEL7).
>
>
> This minimum looks good to me.
>
>     >
>     > Older distros use LTP mostly for regression tests, so it might
>     be acceptable
>     > for users to switch to older release tag, rather than always
>     latest master.
>
>
> I think so. To switch to older release is a better option in that 
> situation.
>
>     >
>     > There's also an option, we create a "legacy" branch for old distros,
>     > and accept only critical fixes (no new tests, rewrites, etc.).
>     It would
>     > be unsupported, but provide place where legacy users can cooperate.
>
>     I was trying to avoid having several active branches for LTP for
>     several
>     reasons. Mainly to avoid people running old LTP on reasonably modern
>     kernels because they were under an impression that older release
>     is more
>     stable. Hence I would like to avoid having this if possible.
>
>
> Yes, to maintain an old LTP branch will also cost more energy, I agree 
> to avoid do that too.
>
> But one more question, if a person posts a patch to fix an older issue 
> which conflicts with the new kernel stuff, what should we do for that?
  In this situation,  I think new kernel stuff has a higher priority if 
older issue is not very serious.
  For Oldest supported , I don't think we must specify a kernel or glibc 
oldest version.

  Kind Regards
  Yang Xu

>
> -- 
> Regards,
> Li Wang




--------------080209070505000304080406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    Hi<br>
    <blockquote
cite="mid:CAEemH2dj3Txm=otnF+UEg2eJY70wTC-5tbT2R1VfrB0qAxtqmQ@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, May 16, 2019 at 5:07
            PM Cyril Hrubis &lt;<a moz-do-not-send="true"
              href="mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;">Hi!<br>
            &gt; &gt; Is it the oldest version we want to support or
            even something older?<br>
            &gt; <br>
            &gt; I'd like minimum to be at least 3.10.0 / glibc-2.17
            (RHEL7).<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size: small;">This
              minimum looks good to me.</div>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;">
            &gt; <br>
            &gt; Older distros use LTP mostly for regression tests, so
            it might be acceptable<br>
            &gt; for users to switch to older release tag, rather than
            always latest master.<br>
          </blockquote>
          <div><br>
          </div>
          <div class="gmail_default" style="font-size: small;">I think
            so. To switch to older release is a better option in that
            situation.</div>
          <div class="gmail_default" style="font-size: small;"></div>
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;">
            &gt; <br>
            &gt; There's also an option, we create a "legacy" branch for
            old distros,<br>
            &gt; and accept only critical fixes (no new tests, rewrites,
            etc.). It would<br>
            &gt; be unsupported, but provide place where legacy users
            can cooperate.<br>
            <br>
            I was trying to avoid having several active branches for LTP
            for several<br>
            reasons. Mainly to avoid people running old LTP on
            reasonably modern<br>
            kernels because they were under an impression that older
            release is more<br>
            stable. Hence I would like to avoid having this if possible.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size: small;">Yes, to
              maintain an old LTP branch will also cost more energy, I
              agree to avoid do that too.</div>
            <br>
          </div>
          <div>
            <div class="gmail_default" style="font-size: small;">But one
              more question, if a person posts a patch to fix an older
              issue which conflicts with the new kernel stuff, what
              should we do for that? </div>
          </div>
        </div>
      </div>
    </blockquote>
     In this <span class="gt-baf-term-text"><span class="gt-baf-cell
        gt-baf-word-clickable">situation,  I think new kernel stuff has
        a higher priority if older issue is not very serious.<br>
         For Oldest supported , I don't think we must specify a kernel
        or glibc oldest version. <br>
      </span></span>
    <pre wrap=""> Kind Regards
 Yang Xu </pre>
    <span class="gt-baf-term-text"><span class="gt-baf-cell
        gt-baf-word-clickable"></span></span>
    <blockquote
cite="mid:CAEemH2dj3Txm=otnF+UEg2eJY70wTC-5tbT2R1VfrB0qAxtqmQ@mail.gmail.com"
      type="cite">
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
    </blockquote>
    <br>
  </body>
</html>

--------------080209070505000304080406--

--===============1674985585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1674985585==--
