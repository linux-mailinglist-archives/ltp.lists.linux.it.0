Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E92A24E8
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 07:53:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52DEF3C54A9
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 07:53:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 943143C23BB
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 07:53:32 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 640B61000B05
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 07:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604300010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x9s5pi2xMQEmLhlZ/GuPIBTLjX9nxNC2n4A8iQ/JiQQ=;
 b=KxnN4nmRDM38fmJEWI939PVztjkNzNC8FodlXCGGBb9iRTxeYamQjsSV75B1D1oZypHMSc
 cMtfNpsf7uqgL6xh9apnqPBIEx7+DHmPQau4/tDsoDtFTzu3RK9dHiVoh9y1IcosfxKo4m
 nJ4sFH/Fpeu20xXYqrH4eAGfMVkxjm0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-G1PP4wThPdu9mOUhSI3Xlg-1; Mon, 02 Nov 2020 01:53:24 -0500
X-MC-Unique: G1PP4wThPdu9mOUhSI3Xlg-1
Received: by mail-yb1-f199.google.com with SMTP id o135so13141021ybc.16
 for <ltp@lists.linux.it>; Sun, 01 Nov 2020 22:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=x9s5pi2xMQEmLhlZ/GuPIBTLjX9nxNC2n4A8iQ/JiQQ=;
 b=WoTewik+vxtXX2tFL8wjoy3MUbUPbyQtTL38aKbVSZLzLXafzzhFH06XoGioZ4BSi7
 fA893oADcYi8ilWJ9fMitBw8tCqzzk/owQeUWt/vRpDG3Otx8ksAavxzDD3fcV4rasu2
 APBliZd7+EkiV9nGn4Drxk4XfcOAt8UAT81nqhIwOXBznyNa+SuzbP20jYSU1RySuGwo
 K7NBIeEQ3wuwIV15GWaUbXZ1FmxrM61ihL3BeWPojVS0nBrUCZeRsWUHcP0RaeTCOGz+
 dWQFqQ/VsKT49bbrDjRueOfYgNhu8mH3CHX+H8peNAURUOfbPax0oKLrDWMq1AylD3HX
 Cnzw==
X-Gm-Message-State: AOAM531MO1nojWyK1m+YBDMqmlyGJ/SOhokfct0i/qDp5z6mEq7dRAkf
 dOtbE+urvZ9gCeJA4xfrRK6C22MZdD1qqaphn53PPRnQw753Y/yqpOi/q63sJqQNy8fzMg7v2zf
 4CQe+UL/lceMnRsbl+k9rGuDe28I=
X-Received: by 2002:a25:aca0:: with SMTP id x32mr19575380ybi.286.1604300003889; 
 Sun, 01 Nov 2020 22:53:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSxQgB6X54Ed4klfXSbY0UAUIF6RO32/AWz139n9fpWGxQQqRTrJopngo4WmqBZBmnjhMy95o4k8K2dR9xuss=
X-Received: by 2002:a25:aca0:: with SMTP id x32mr19575363ybi.286.1604300003615; 
 Sun, 01 Nov 2020 22:53:23 -0800 (PST)
MIME-Version: 1.0
References: <CAEemH2d8+5qLLKWsuf5WJeLHdv2VfPZiyM9-oW=WyH4m==h=8g@mail.gmail.com>
 <20201027132334.1027-1-rpalethorpe@suse.com>
 <CAEemH2cevcmS1Cq-t0667CwQmxWL=6YNdBzvKNem2YV1E5EVSg@mail.gmail.com>
In-Reply-To: <CAEemH2cevcmS1Cq-t0667CwQmxWL=6YNdBzvKNem2YV1E5EVSg@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Nov 2020 14:53:12 +0800
Message-ID: <CAEemH2f2-ByWBtrwukF_B8q_yGMj4Km6VN15viT7cAeisa8w0w@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] madvise06: Increase reliability and diagnostic
 info
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
Content-Type: multipart/mixed; boundary="===============1990401941=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1990401941==
Content-Type: multipart/alternative; boundary="000000000000d43e5505b31a3367"

--000000000000d43e5505b31a3367
Content-Type: text/plain; charset="UTF-8"

Cc LTP ML.

On Mon, Nov 2, 2020 at 2:50 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Tue, Oct 27, 2020 at 9:24 PM Richard Palethorpe <rpalethorpe@suse.com>
> wrote:
>
>> When memcg.limit_in_bytes is set to PASS_THRESHOLD it's unlikely
>> swapcached will increase by more than PASS_THRESHOLD unless processes
>> in other memcgs are also increasing it. Additionally MADV_WILLNEED
>> must remove pages from memory as it adds more so that the first page
>> may not be in memory by the time the last page is faulted if the
>> amount exceeds the memory limit (which it does because CHUNK_SZ >
>> PASS_THRESSHOLD). Worse if pages are faulted in a non-linear way, or
>> the process must access some other pages, then there is no guarantee
>> which parts of the range will be resident in memory. This results in
>> spurious test failures.
>>
>> To solve this we can set PASS_THRESHOLD to 1/4 of CHUNK_SZ and
>> memcg.limit_in_bytes to 1/2 of CHUNK_SZ (MEM_LIMIT), then mark
>> MEM_LIMIT bytes as needed. That way the amount in the SwapCache will
>> easily be more than the threshold. Secondly we can run madvise again
>> on PASS_THRESHOLD bytes and check that dirtying all of these does not
>> result in too many page faults. We also run the second test on every
>> occasion to ensure the test code itself is still valid. If the
>> original bug is present then both tests fail.
>>
>> Finally this prints more diagnostic information to help with debugging
>> the test.
>>
>> While debugging the test a kernel bug was found in 5.9 which effects
>> CGroupV1 when use_hierarchy=0. This is unlikely to effect many users,
>> but a fix is pending and will be referenced in the test when
>> available. It is recommended that you set use_hierarchy=1.
>>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> Reviewed-by: Li Wang <liwang@redhat.com>
>> ---
>>
>
> Applied the patch V2, thanks!
>
> --
> Regards,
> Li Wang
>


-- 
Regards,
Li Wang

--000000000000d43e5505b31a3367
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Cc LTP ML.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 2, 2020 at 2:50 PM Li Wang &lt;<a=
 href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div d=
ir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 27, 2020 at=
 9:24 PM Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com" tar=
get=3D"_blank">rpalethorpe@suse.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">When memcg.limit_in_bytes is set to PASS=
_THRESHOLD it&#39;s unlikely<br>
swapcached will increase by more than PASS_THRESHOLD unless processes<br>
in other memcgs are also increasing it. Additionally MADV_WILLNEED<br>
must remove pages from memory as it adds more so that the first page<br>
may not be in memory by the time the last page is faulted if the<br>
amount exceeds the memory limit (which it does because CHUNK_SZ &gt;<br>
PASS_THRESSHOLD). Worse if pages are faulted in a non-linear way, or<br>
the process must access some other pages, then there is no guarantee<br>
which parts of the range will be resident in memory. This results in<br>
spurious test failures.<br>
<br>
To solve this we can set PASS_THRESHOLD to 1/4 of CHUNK_SZ and<br>
memcg.limit_in_bytes to 1/2 of CHUNK_SZ (MEM_LIMIT), then mark<br>
MEM_LIMIT bytes as needed. That way the amount in the SwapCache will<br>
easily be more than the threshold. Secondly we can run madvise again<br>
on PASS_THRESHOLD bytes and check that dirtying all of these does not<br>
result in too many page faults. We also run the second test on every<br>
occasion to ensure the test code itself is still valid. If the<br>
original bug is present then both tests fail.<br>
<br>
Finally this prints more diagnostic information to help with debugging<br>
the test.<br>
<br>
While debugging the test a kernel bug was found in 5.9 which effects<br>
CGroupV1 when use_hierarchy=3D0. This is unlikely to effect many users,<br>
but a fix is pending and will be referenced in the test when<br>
available. It is recommended that you set use_hierarchy=3D1.<br>
<br>
Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_bl=
ank">liwang@redhat.com</a>&gt;<br>
---<br></blockquote><div><br></div><div><div style=3D"font-size:small">Appl=
ied the patch V2, thanks!</div></div><div>=C2=A0</div></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000d43e5505b31a3367--


--===============1990401941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1990401941==--

