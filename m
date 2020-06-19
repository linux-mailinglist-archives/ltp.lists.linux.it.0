Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C48E1FFFEE
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 03:55:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 173163C2CA1
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 03:55:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E32D03C22FE
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 03:55:15 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 33739600D03
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 03:55:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592531713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0diV02btVTy81yvr8Vyh9nYU4q8ahhSO5ig7q24RO+M=;
 b=BVHJfnGEEYSSPJkmzDc2QxBTr4SLEgNYB9Z0Z+J2PMavyv61IK1mFHb8yuPCSiROhqk3D9
 vkshX3i/SciOAZrEm4DQmaGdRejs1intwpAs3Yx6QR8wUKkN8IX5WsOWGcMkv2t8STg1t1
 /EZxK5Xle+TmhNNm17rdN8o2JJ+BcvE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-Y2u7jg3fOrekER6_cxxb8w-1; Thu, 18 Jun 2020 21:55:11 -0400
X-MC-Unique: Y2u7jg3fOrekER6_cxxb8w-1
Received: by mail-lf1-f70.google.com with SMTP id n17so2741796lfe.15
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 18:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rfTjRthoXlNNaNs8VPh0ZZbW7MDFiiaCV38v0rcthHs=;
 b=ZqS3ItdYF1M0dUnsBh851QbZHKpzKTagfnXJB7Z++HxLJLA0yWXJDNLABgLTmmUefP
 1QyueRpCCDVtLwB/1v/Cve/ZILXFFIUnMMZ22DYek/O60foZXWx1HmrjOYSVrKIf6Ect
 VH8R7lUASyTBC5MYBOiFC2374g4i0B2DPsokauvcq7UXOEkgZoU3UmkRtg6yF/Mqf50D
 W2gaD0pSlin9g8tvm7+sH3ghwqz9pvM5PST5evzQBYo/B1iabzSz8n7l6i5yHLlHeIGx
 uBiRxUtNo7o7DKG0M1IngdtsuVSZETnkBkBmZvFYYOJVS/mSybDX5Rvw05ELqt5+LoEJ
 8eig==
X-Gm-Message-State: AOAM533gI44c/5XoY6m7VavCxm5TAHgvPbSvn+M94YpE2AtPfcX4pK3Z
 eGAaJk//BsjLmvGTEyaECY9qvx6VbwU1oL7HcvF0mm7aqZQ10LEKY7AjHNOwZIdt4X3K380QSOz
 r1SW3xVTZk0eQnQ38DunJ2SOgfGI=
X-Received: by 2002:a19:381a:: with SMTP id f26mr591458lfa.110.1592531709609; 
 Thu, 18 Jun 2020 18:55:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrRrsj+evfnmiuNNxyPzbvGGKKexg/GdTT2UAP9peR5YevLzu1N9rbgPvX9vYfYjZPwYAm3f6rY83QvhpgWN0=
X-Received: by 2002:a19:381a:: with SMTP id f26mr591446lfa.110.1592531709367; 
 Thu, 18 Jun 2020 18:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <53a3e9975f00c50c78528994472ec7e9f8adeb90.1592475774.git.jstancek@redhat.com>
 <CAEemH2fgg9KOO5KxTwr0LpGdL2X0p_aGefNuwQQjajkRNJKk9Q@mail.gmail.com>
In-Reply-To: <CAEemH2fgg9KOO5KxTwr0LpGdL2X0p_aGefNuwQQjajkRNJKk9Q@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Jun 2020 09:54:57 +0800
Message-ID: <CAEemH2cGcAGuL-sJsLWJdfvKUc+05pyTiZyV9GoVo0ktf_Mxvw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clocks/invaliddates.c: relax acceptable delta
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
Content-Type: multipart/mixed; boundary="===============0715271381=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0715271381==
Content-Type: multipart/alternative; boundary="000000000000d4e48205a8662e84"

--000000000000d4e48205a8662e84
Content-Type: text/plain; charset="UTF-8"

Li Wang <liwang@redhat.com> wrote:


> On Thu, Jun 18, 2020 at 6:24 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>> Test allows just 5ms delta for PASS, and test randomly fails in
>> environments with shared resources and increased steal time.
>>
>> Relax the condition and also print deltas if test fails.
>> Remove DEBUG ifdefs and main parameters to avoid unused variable
>> warning.
>>
>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>> ---
>>  .../functional/timers/clocks/invaliddates.c   | 25 +++++++------------
>>  1 file changed, 9 insertions(+), 16 deletions(-)
>>
>> diff --git
>> a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
>> b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
>> index face334fd250..d4116b1e9bc0 100644
>> ---
>> a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
>> +++
>> b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
>> @@ -18,8 +18,7 @@
>>
>>  #define NUMTESTS 5...
>>
>> -#define ACCEPTABLESECDELTA 0
>> -#define ACCEPTABLENSECDELTA 5000000
>> +#define ACCEPTABLESECDELTA 2
>>
>
> It's hard to say what size of the second-delta is a proper value, but to
> increase it can obviously decrease the failure probability. If there is no
> better way I'd go with this patch.
>

But in another word, this test is just focused on invalid dates[1], so
the deviation(caused by sharing resource) in seconds(even 10 seconds) bound
is acceptable I think.

If someone insists to make thing more precise, we can make use of
function tst_is_virt() to apply this method only for virtual machines. But
anyway that's not very important:).

[1].
static int testtimes[NUMTESTS][2] = {
    {INT32_MAX, 999999999}, // large number
    {946713600, 999999999}, // Y2K - Jan 1, 2000
    {951811200, 999999999}, // Y2K - Feb 29, 2000
    {1078041600, 999999999}, // Y2K - Feb 29, 2004
    {1049623200, 999999999}, // daylight savings 2003
};

-- 
Regards,
Li Wang

--000000000000d4e48205a8662e84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redha=
t.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1=
8, 2020 at 6:24 PM Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" t=
arget=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Test allows just 5ms delta for PASS, an=
d test randomly fails in<br>
environments with shared resources and increased steal time.<br>
<br>
Relax the condition and also print deltas if test fails.<br>
Remove DEBUG ifdefs and main parameters to avoid unused variable<br>
warning.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0.../functional/timers/clocks/invaliddates.c=C2=A0 =C2=A0| 25 +++++++-=
-----------<br>
=C2=A01 file changed, 9 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/testcases/open_posix_testsuite/functional/timers/clocks/invali=
ddates.c b/testcases/open_posix_testsuite/functional/timers/clocks/invalidd=
ates.c<br>
index face334fd250..d4116b1e9bc0 100644<br>
--- a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.=
c<br>
+++ b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.=
c<br>
@@ -18,8 +18,7 @@<br>
<br>
=C2=A0#define NUMTESTS 5.<span class=3D"gmail_default" style=3D"font-size:s=
mall">..</span><br>
<br>
-#define ACCEPTABLESECDELTA 0<br>
-#define ACCEPTABLENSECDELTA 5000000<br>
+#define ACCEPTABLESECDELTA 2<br></blockquote><div><br></div><div><div styl=
e=3D"font-size:small">It&#39;s hard to say what size of the second-delta is=
 a proper value, but to increase it can obviously decrease=C2=A0the failure=
=C2=A0probability. If there is no better way I&#39;d go with this patch.=C2=
=A0</div></div></div></div></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">But in another word, this test is j=
ust focused=C2=A0on invalid dates[1], so the=C2=A0deviation(caused by shari=
ng resource) in seconds(even 10 seconds) bound is acceptable I think.=C2=A0=
</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">If someone insists=
 to make thing more precise, we can make use of function=C2=A0tst_is_virt()=
 to apply this method only for virtual machines. But anyway that&#39;s not =
very important:).</div><div class=3D"gmail_default"><br></div><div class=3D=
"gmail_default">[1].</div><div class=3D"gmail_default">static int testtimes=
[NUMTESTS][2] =3D {<br>=C2=A0 =C2=A0 {INT32_MAX, 999999999},=09// large num=
ber<br>=C2=A0 =C2=A0 {946713600, 999999999},=09// Y2K - Jan 1, 2000<br>=C2=
=A0 =C2=A0 {951811200, 999999999},=09// Y2K - Feb 29, 2000<br>=C2=A0 =C2=A0=
 {1078041600, 999999999},=09// Y2K - Feb 29, 2004<br>=C2=A0 =C2=A0 {1049623=
200, 999999999},=09// daylight savings 2003<br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">};</div><div><br></div></div>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></di=
v><div>Li Wang<br></div></div></div></div>

--000000000000d4e48205a8662e84--


--===============0715271381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0715271381==--

