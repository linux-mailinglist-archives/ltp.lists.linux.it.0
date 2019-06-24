Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 522EF5048C
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 10:28:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23FF93C1820
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 10:28:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 488E33C0638
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 10:28:32 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0155D6006DD
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 10:28:33 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id a97so5332042uaa.9
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 01:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2aoHokUbwEt80XfjRGQkfHdriuuKOaSSANUiQyBnzY=;
 b=qsz35wCyCdhd7WOb8BB0Adaxx1gmJF4v2b4ClcM0pnVrsBYn8QP0/jB4R0xX5uvFI6
 qe+EPzq3jsGkGuVp+1sNeFQlx5QfH+L1XZ13EzJ6DrhS5ovtShZtH6ON3rrOoSGQb3rO
 LO2nJB+1qdBAMoHDYEU5yaGnQlSqlx1egYNlywRAwjLAyPivAvgRLuzI8ruHXjH4HiqZ
 hw0h4v3w2SSf/rC02t391MvJk5hmld7IJYLYlvEmU7/WUOFfDm1DZldYOX99NU4jsGow
 MEvaMxdnu1zmoyo8sW379OwzmIEy55eSuNJFA4KV3u28DBtlUnDA+XGKgKDtKY7rS+pF
 hs8w==
X-Gm-Message-State: APjAAAXCuEOCKRxjGY3eaT/h4/yKqo04xo9+J0O6On2Jgk2OgFj8+i4W
 13diRAH6FbeLVAZlm/h8huplWGIj7sZowi/bdF0sEw==
X-Google-Smtp-Source: APXvYqx3jyV2DBMfZjP4xesPSPPFFFSB20beol2N5PqwFIwgX1VqIcvp/OztR7X5u9PG7HCQBZiKCuOwhMnLQ4yQG54=
X-Received: by 2002:a9f:3105:: with SMTP id m5mr7501413uab.142.1561364903765; 
 Mon, 24 Jun 2019 01:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190621102628.4800-4-liwang@redhat.com>
 <1186374967.29667455.1561359397802.JavaMail.zimbra@redhat.com>
 <CAEemH2chU7KYJida_09RVWDMQRQLyv9igr5-j464SsKQj3svDA@mail.gmail.com>
In-Reply-To: <CAEemH2chU7KYJida_09RVWDMQRQLyv9igr5-j464SsKQj3svDA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 24 Jun 2019 16:28:12 +0800
Message-ID: <CAEemH2fn9qhKBbYviKHbkDuV40kE=sK8b36-g=X31n5ihhCwtw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Content-Type: multipart/mixed; boundary="0000000000007470ea058c0d9857"
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2 3/3] pkey: add pkey02 test
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--0000000000007470ea058c0d9857
Content-Type: multipart/alternative; boundary="0000000000007470e7058c0d9855"

--0000000000007470e7058c0d9855
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 3:27 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Mon, Jun 24, 2019 at 2:56 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>>
>>
>> ----- Original Message -----
>> > Signed-off-by: Li Wang <liwang@redhat.com>
>> > +
>> > +static void pkey_tests(int pkey, int prot, int flags, int fd)
>> > +{
>> > +     char *buffer;
>> > +
>> > +     if (fd == 0) {
>> > +             fd = SAFE_OPEN(TEST_FILE, O_RDWR | O_CREAT, 0664);
>> > +     }
>> > +
>> > +     buffer = SAFE_MMAP(NULL, psize, prot, flags, fd, 0);
>> > +
>> > +     if (pkey_mprotect(buffer, psize, prot, pkey) == -1)
>> > +             tst_brk(TBROK, "pkey_mprotect failed");
>> > +
>> > +     tst_res(TPASS, "apply pkey to the buffer area success");
>> > +
>> > +     if (fd > 0) {
>> > +             SAFE_CLOSE(fd);
>> > +     }
>> > +
>> > +     SAFE_MUNMAP(buffer, psize);
>> > +}
>> > +
>>
>> Hi,
>>
>> pkey02 doesn't try to read/write as pkey01, but otherwise two tests look
>> very similar.
>>
>> Could we try to read/write here as well for all combinations of map flags?
>> Then pkey01 could be dropped since pkey02 would cover more than just 1
>> combination.
>> Or is there a different reason behind separate tests, that I'm missing?
>>
>>
> The pkey02 is a follow new test idea(test more types of memory) after I
> completed pkey01.
>
> Yes, the diffenrence bettwen them is pkey02 cover more map flags but not
> do R/W verification. That's because I'm hoping to add {0, 0x0} to the test
> which does not trigger SIGSEGV in pkey02, it seems a bit tricky to
> distinguish the SIGSEGV is come from 0x0(if bug there)
> or PKEY_DISABLE_ACCESS progress.
>
>
Well, a smple way I can find is to remove the {0, 0x0} from struct tcase,
and test the access right 0x0 in lastly.

So, what do you think about the new key02(merge key01 and old key02) in
this attatchment?

-- 
Regards,
Li Wang

--0000000000007470e7058c0d9855
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 24, 2019 at 3:27 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 24, 2019 at 2:56=
 PM Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"_blank=
">jstancek@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +static void pkey_tests(int pkey, int prot, int flags, int fd)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *buffer;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(TEST=
_FILE, O_RDWR | O_CREAT, 0664);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buffer =3D SAFE_MMAP(NULL, psize, prot, flags, fd=
, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pkey_mprotect(buffer, psize, prot, pkey) =3D=
=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
pkey_mprotect failed&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;apply pkey to the buffer are=
a success&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_MUNMAP(buffer, psize);<br>
&gt; +}<br>
&gt; +<br>
<br>
Hi,<br>
<br>
pkey02 doesn&#39;t try to read/write as pkey01, but otherwise two tests loo=
k<br>
very similar.<br>
<br>
Could we try to read/write here as well for all combinations of map flags?<=
br>
Then pkey01 could be dropped since pkey02 would cover more than just 1 comb=
ination.<br>
Or is there a different reason behind separate tests, that I&#39;m missing?=
<br>
<br></blockquote><div><br></div><div style=3D"font-size:small">The pkey02 i=
s a follow new test idea(test more types of memory) after I completed pkey0=
1.=C2=A0</div><div style=3D"font-size:small"><br></div><div style=3D"font-s=
ize:small">Yes, the diffenrence bettwen them is pkey02 cover more map flags=
 but not do R/W verification. That&#39;s because I&#39;m hoping to add {0, =
0x0} to the test which does not trigger=C2=A0SIGSEGV in pkey02, it seems a =
bit tricky to distinguish the SIGSEGV is come from 0x0(if bug there) or=C2=
=A0PKEY_DISABLE_ACCESS progress.</div></div><div dir=3D"ltr" class=3D"gmail=
-m_-4240269076149745183gmail_signature"><div dir=3D"ltr"><div><br></div></d=
iv></div></div></blockquote><div><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Well, a smple way I can find is to remove the {0, 0x=
0} from struct tcase, and test the access right 0x0 in lastly.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">So, what do you think about the new k=
ey02(merge key01 and old key02) in this attatchment?</div></div><div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007470e7058c0d9855--

--0000000000007470ea058c0d9857
Content-Type: text/x-csrc; charset="US-ASCII"; name="pkey02_new.c"
Content-Disposition: attachment; filename="pkey02_new.c"
Content-Transfer-Encoding: base64
Content-ID: <f_jxa4bmrj0>
X-Attachment-Id: f_jxa4bmrj0

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKLyoKICogQ29weXJp
Z2h0IChjKSAyMDE5IFJlZCBIYXQsIEluYy4KICoKICogVGVzdCBmb3IgTWVtb3J5IFByb3RlY3Rp
b24gS2V5cyBvbiBkaWZmZXJlbnQgbWVtb3J5IGFyZWEuCiAqLwoKI2RlZmluZSBfR05VX1NPVVJD
RQojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8ZXJybm8u
aD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KI2luY2x1ZGUg
PHN5cy9tbWFuLmg+CiNpbmNsdWRlIDxzeXMvd2FpdC5oPgoKI2luY2x1ZGUgInBrZXkuaCIKCiNk
ZWZpbmUgVE1QX0RJUiAidG1wX3BrZXkiCiNkZWZpbmUgVEVTVF9GSUxFIFRNUF9ESVIiL3Rlc3Rm
aWxlIgojZGVmaW5lIFNUUiAiYWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXoxMjM0NVxuIgoKc3Rh
dGljIGludCBwc2l6ZTsKCnN0YXRpYyBzdHJ1Y3QgdGNhc2UgewoJdW5zaWduZWQgbG9uZyBmbGFn
czsKCXVuc2lnbmVkIGxvbmcgYWNjZXNzX3JpZ2h0czsKCWNoYXIgKm5hbWU7Cn0gdGNhc2VzW10g
PSB7Cgl7MCwgUEtFWV9ESVNBQkxFX0FDQ0VTUywgIlBLRVlfRElTQUJMRV9BQ0NFU1MifSwKCXsw
LCBQS0VZX0RJU0FCTEVfV1JJVEUsICJQS0VZX0RJU0FCTEVfV1JJVEUifSwKfTsKCnN0YXRpYyB2
b2lkIHNldHVwKHZvaWQpCnsKCWludCBpLCBmZDsKCglwc2l6ZSA9IGdldHBhZ2VzaXplKCk7CglT
QUZFX01LRElSKFRNUF9ESVIsIDA2NjQpOwoJU0FGRV9NT1VOVChUTVBfRElSLCBUTVBfRElSLCAi
dG1wZnMiLCAwLCBOVUxMKTsKCgljaGVja19wa2V5X3N1cHBvcnQoKTsKCglmZCA9IFNBRkVfT1BF
TihURVNUX0ZJTEUsIE9fUkRXUiB8IE9fQ1JFQVQsIDA2NjQpOwoJZm9yIChpID0gMDsgaSA8IDEy
ODsgaSsrKQoJCVNBRkVfV1JJVEUoMSwgZmQsIFNUUiwgc3RybGVuKFNUUikpOwoKCVNBRkVfQ0xP
U0UoZmQpOwp9CgpzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCnsKCVNBRkVfVU1PVU5UKFRNUF9E
SVIpOwoJU0FGRV9STURJUihUTVBfRElSKTsKfQoKc3RhdGljIHN0cnVjdCBtbWFwX3BhcmFtIHsK
CWludCBwcm90OwoJaW50IGZsYWdzOwoJaW50IGZkOwp9IG1tYXBfcGFyYW1zW10gPSB7Cgl7UFJP
VF9SRUFELCAgTUFQX0FOT05ZTU9VUyB8IE1BUF9QUklWQVRFLCAtMX0sCgl7UFJPVF9SRUFELCAg
TUFQX0FOT05ZTU9VUyB8IE1BUF9TSEFSRUQsIC0xfSwKCXtQUk9UX1JFQUQsIE1BUF9QUklWQVRF
LCAwfSwKCXtQUk9UX1JFQUQsIE1BUF9TSEFSRUQsIDB9LAoJe1BST1RfV1JJVEUsIE1BUF9BTk9O
WU1PVVMgfCBNQVBfUFJJVkFURSwgLTF9LAoJe1BST1RfV1JJVEUsIE1BUF9BTk9OWU1PVVMgfCBN
QVBfU0hBUkVELCAtMX0sCgl7UFJPVF9XUklURSwgTUFQX1BSSVZBVEUsIDB9LAoJe1BST1RfV1JJ
VEUsIE1BUF9TSEFSRUQsIDB9LAoJe1BST1RfRVhFQywgTUFQX0FOT05ZTU9VUyB8IE1BUF9QUklW
QVRFLCAtMX0sCgl7UFJPVF9FWEVDLCBNQVBfQU5PTllNT1VTIHwgTUFQX1NIQVJFRCwgLTF9LAoJ
e1BST1RfRVhFQywgTUFQX1BSSVZBVEUsIDB9LAoJe1BST1RfRVhFQywgTUFQX1NIQVJFRCwgMH0s
Cgl7UFJPVF9SRUFEIHwgUFJPVF9XUklURSwgTUFQX0FOT05ZTU9VUyB8IE1BUF9QUklWQVRFLCAt
MX0sCgl7UFJPVF9SRUFEIHwgUFJPVF9XUklURSwgTUFQX0FOT05ZTU9VUyB8IE1BUF9TSEFSRUQs
IC0xfSwKCXtQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLCBNQVBfUFJJVkFURSwgMH0sCgl7UFJPVF9S
RUFEIHwgUFJPVF9XUklURSwgTUFQX1NIQVJFRCwgMH0sCgl7UFJPVF9SRUFEIHwgUFJPVF9XUklU
RSB8IFBST1RfRVhFQywgTUFQX0FOT05ZTU9VUyB8IE1BUF9QUklWQVRFLCAtMX0sCgl7UFJPVF9S
RUFEIHwgUFJPVF9XUklURSB8IFBST1RfRVhFQywgTUFQX0FOT05ZTU9VUyB8IE1BUF9TSEFSRUQs
IC0xfSwKCXtQUk9UX1JFQUQgfCBQUk9UX1dSSVRFIHwgUFJPVF9FWEVDLCBNQVBfUFJJVkFURSwg
MH0sCgl7UFJPVF9SRUFEIHwgUFJPVF9XUklURSB8IFBST1RfRVhFQywgTUFQX1NIQVJFRCwgMH0s
Cn07CgpzdGF0aWMgdm9pZCBwa2V5X3Rlc3RzKHN0cnVjdCB0Y2FzZSAqdGMsIHN0cnVjdCBtbWFw
X3BhcmFtICptcGEpCnsKCXBpZF90IHBpZDsKCWNoYXIgKmJ1ZmZlcjsKCWludCBwa2V5LCBzdGF0
dXM7CglpbnQgZmQgPSBtcGEtPmZkOwoKCWlmIChmZCA9PSAwKQoJCWZkID0gU0FGRV9PUEVOKFRF
U1RfRklMRSwgT19SRFdSIHwgT19DUkVBVCwgMDY2NCk7CgoJYnVmZmVyID0gU0FGRV9NTUFQKE5V
TEwsIHBzaXplLCBtcGEtPnByb3QsIG1wYS0+ZmxhZ3MsIGZkLCAwKTsKCglwa2V5ID0gcGtleV9h
bGxvYyh0Yy0+ZmxhZ3MsIHRjLT5hY2Nlc3NfcmlnaHRzKTsKCWlmIChwa2V5ID09IC0xKQoJCXRz
dF9icmsoVEJST0ssICJwa2V5X2FsbG9jIGZhaWxlZCIpOwoKCXRzdF9yZXMoVElORk8sICJTZXQg
JXMgb24gYnVmZmVyIiwgdGMtPm5hbWUpOwoJaWYgKHBrZXlfbXByb3RlY3QoYnVmZmVyLCBwc2l6
ZSwgbXBhLT5wcm90LCBwa2V5KSA9PSAtMSkKCQl0c3RfYnJrKFRCUk9LLCAicGtleV9tcHJvdGVj
dCBmYWlsZWQiKTsKCglwaWQgPSBTQUZFX0ZPUksoKTsKCWlmIChwaWQgPT0gMCkgewoJCS8qIENo
aWxkcmVuIGNyYXNoIGFyZSBleHBlY3RlZCwgYXZvaWQgZHVtcGluZyBjb3JlZmlsZSAqLwoJCXN0
cnVjdCBybGltaXQgcjsKCgkJci5ybGltX2N1ciA9IDE7CgkJci5ybGltX21heCA9IDE7CgkJU0FG
RV9TRVRSTElNSVQoUkxJTUlUX0NPUkUsICZyKTsKCgkJc3dpdGNoICh0Yy0+YWNjZXNzX3JpZ2h0
cykgewoJCQljYXNlIFBLRVlfRElTQUJMRV9BQ0NFU1M6CgkJCXRzdF9yZXMoVEZBSUwsICJSZWFk
IGJ1ZmZlciBzdWNjZXNzLCBidWZmZXJbMF0gPSAlZCIsICpidWZmZXIpOwoJCWJyZWFrOwoJCQlj
YXNlIFBLRVlfRElTQUJMRV9XUklURToKCQkJKmJ1ZmZlciA9ICdiJzsKCQlicmVhazsKCQl9CgkJ
ZXhpdCgwKTsKCX0KCglTQUZFX1dBSVRQSUQocGlkLCAmc3RhdHVzLCAwKTsKCWlmIChXSUZTSUdO
QUxFRChzdGF0dXMpKSB7CgkJaWYgKFdURVJNU0lHKHN0YXR1cykgPT0gU0lHU0VHVikgewoJCQl0
c3RfcmVzKFRQQVNTLCAiQ2hpbGQgZW5kZWQgYnkgJXMgYXMgZXhwZWN0ZWQiLAoJCQkJdHN0X3N0
cnNpZyhTSUdTRUdWKSk7CgkJfSBlbHNlIHsKCQkJdHN0X3JlcyhURkFJTCwgIkNoaWxkIGVuZGVk
IGJ5ICVzIHVuZXhwZWN0ZWQiICwKCQkJCXRzdF9zdHJzaWcoV1RFUk1TSUcoc3RhdHVzKSkpOwoJ
CX0KCX0gZWxzZSB7CgkJdHN0X3JlcyhURkFJTCwgIkNoaWxkIHVuZXhwZWN0ZWRseSBlbmRlZCIp
OwoJfQoKCXRzdF9yZXMoVElORk8sICJSZW1vdmUgJXMgZnJvbSBidWZmZXIiLCB0Yy0+bmFtZSk7
CglpZiAocGtleV9tcHJvdGVjdChidWZmZXIsIHBzaXplLCBtcGEtPnByb3QsIDB4MCkgPT0gLTEp
CgkJdHN0X2JyayhUQlJPSywgInBrZXlfbXByb3RlY3QgZmFpbGVkIik7CgoJc3dpdGNoIChtcGEt
PnByb3QpIHsKCQljYXNlIFBST1RfUkVBRDoKCQl0c3RfcmVzKFRQQVNTLCAiUmVhZCBidWZmZXIg
c3VjY2VzcywgYnVmZmVyWzBdID0gJWQiLCAqYnVmZmVyKTsKCWJyZWFrOwoJCWNhc2UgUFJPVF9X
UklURToKCQkqYnVmZmVyID0gJ2InOwoJCXRzdF9yZXMoVFBBU1MsICJXcml0ZSBidWZmZXIgc3Vj
Y2VzcywgYnVmZmVyWzBdID0gJWQiLCAqYnVmZmVyKTsKCWJyZWFrOwoJCWNhc2UgUFJPVF9SRUFE
fFBST1RfV1JJVEU6CgkJKmJ1ZmZlciA9ICdiJzsKCQl0c3RfcmVzKFRQQVNTLCAiUmVhZC9Xcml0
ZSBidWZmZXIgc3VjY2VzcywgYnVmZmVyWzBdID0gJWQiLCAqYnVmZmVyKTsKCWJyZWFrOwoJfQoK
CWlmIChmZCA+IDApIHsKCQlTQUZFX0NMT1NFKGZkKTsKCX0KCglTQUZFX01VTk1BUChidWZmZXIs
IHBzaXplKTsKCglpZiAocGtleV9mcmVlKHBrZXkpID09IC0xKQoJCXRzdF9icmsoVEJST0ssICJw
a2V5X2ZyZWUgZmFpbGVkIik7Cn0KCnN0YXRpYyB2b2lkIHZlcmlmeV9wa2V5KHVuc2lnbmVkIGlu
dCBpKQp7Cglsb25nIHVuc2lnbmVkIGludCBqOwoJc3RydWN0IG1tYXBfcGFyYW0gKm1wYTsKCglz
dHJ1Y3QgdGNhc2UgKnRjID0gJnRjYXNlc1tpXTsKCglmb3IgKGogPSAwOyBqIDwgQVJSQVlfU0la
RShtbWFwX3BhcmFtcyk7IGorKykgewoJCW1wYSA9ICZtbWFwX3BhcmFtc1tqXTsKCgkJcGtleV90
ZXN0cyh0YywgbXBhKTsKCX0KfQoKc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewoJLnRj
bnQgPSBBUlJBWV9TSVpFKHRjYXNlcyksCgkuZm9ya3NfY2hpbGQgPSAxLAoJLnRlc3QgPSB2ZXJp
ZnlfcGtleSwKCS5zZXR1cCA9IHNldHVwLAoJLmNsZWFudXAgPSBjbGVhbnVwLAp9Owo=
--0000000000007470ea058c0d9857
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--0000000000007470ea058c0d9857--
