Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEAC3C9AF9
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:05:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E37783C863D
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:05:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 56A233C2197
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:05:31 +0200 (CEST)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C772B1001195
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:05:30 +0200 (CEST)
Received: by mail-io1-xd2b.google.com with SMTP id h6so5600728iok.6
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 02:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHnBpOVIwGalxpXBuYMpjXaj3Ewg0MrRynTXgxtW330=;
 b=iM0fR5qefkwvd5yAWbagSb6JoP2mouiJzFeBMjUFON+EwIvs0TKsLnJf75Ms2sk1NQ
 NmcNIo/GHXD4cp0AFjWgIB2+Sxv1S+GoYNTFjawGybbBcxeLe31ZzKhXs3P6+iJexDhb
 gasrp4nL8IFwXjswV6HXfNTEn4IKMgaa7EhIuWNdDbnvAVD+oCzwbM5efduKrUpxrzqX
 Sdb1CFQNndBhXjgPai8XgwW4rox42mHseII4l1hCzBC4cN5MVOucZNFRnvxjwGWGy1cD
 TVkJaJ7RdHL/qh7nPL5eSWd5JGHM5njo3bWDmavlbA+Jprr3zrkCCLK1tsQv9FJsf4K0
 7OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHnBpOVIwGalxpXBuYMpjXaj3Ewg0MrRynTXgxtW330=;
 b=F1Hz1CtWpYG9kCpesfwyG0x0fIkbB+7w9R7FtdxWgVZrG0Eb77NoCYBrDpsVh6QFyN
 Ymj3kzrfByv6uI/uzmu45yDe+PQNHlb6qSFvcrJr/vYOmha7lSQUh6oba/bp1cg0WVpo
 AxxcNBXLcF+BLOzdau68XKnu6navdfCF/Ywrw7dp2aRSml060TpQ7W5KRii7IIl4TQBo
 X5MLkLEMkLNB42tXiiCAqEZGe448ob/RH2jpUfryOIABkIh+rnPm0CTM+nZ+eEy0+7QA
 qxIfIZ41DmdvcWyS3E24P6EwCYNZamk26xjPIc1YK9uLhTxNSy9Efeb+dl8EizgsQlJz
 MTZA==
X-Gm-Message-State: AOAM5320XW50RmnafSmzEuug+hstG00mMayes22DXdHDo8K2FCDVcgWY
 to58SJ8emyYYVPfNCnqO6qXGJ3Spy9YmZLcwig4=
X-Google-Smtp-Source: ABdhPJy27geudlEtikVyGNZDuUBn32zXrUPH187xVZlEM9stjan3/Okm8BLOsRWsSwaGDA00vLjtoMgvv14Pm6Rqxyo=
X-Received: by 2002:a05:6638:4109:: with SMTP id
 ay9mr3004336jab.81.1626339929371; 
 Thu, 15 Jul 2021 02:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210714180840.160798-1-amir73il@gmail.com>
 <YO/e3wcY8oXyFCO5@pevik>
In-Reply-To: <YO/e3wcY8oXyFCO5@pevik>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jul 2021 12:05:18 +0300
Message-ID: <CAOQ4uxj_vJVXTJex1W1cAJ_LQkbNqUnasuiUTsp=Bgrznm472A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Content-Type: multipart/mixed; boundary="000000000000c68b5a05c725c5d2"
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify: Fix running tests in a loop
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--000000000000c68b5a05c725c5d2
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 15, 2021 at 10:08 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > Both fanotify19 and fanotify18 leaked fds when run in a loop.
> > fanotify19 was not checking child process exit status correctly
> > which resulted in random failures.
>
> Thanks for a quick fix!
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> FYI both fixes prolonged running for about 100% (comparing with runs on master
> which don't fail). Of course, that's not a problem at all, it's just interesting
> for me how simple closing of file descriptor can be expensive.
>

Nice observation! LTP is not the only test suite that observed this issue. See:
https://lore.kernel.org/linux-fsdevel/CAC-ggsFLmFpz5Y=-9MMLwxuO2LOS9rhpewDp_-u2hrT9J79ryg@mail.gmail.com/

In order to fix that issue we will need some LTP helpers to take care of closing
fanotify/inotify fds in batches for loop runs, which is kind of what
happened before
the fd leak fix only the batch was infinite...

Attached sample patch for fanotify18.
You will need to run some more experiments to see if it is worth it or not
and then if it is worth it, probably generalize the helpers.

Thanks,
Amir.




> Kind regards,
> Petr
>
> # time ./fanotify19 -i40
>
> Summary:
> passed   360
> failed   0
> broken   0
> skipped  0
> warnings 0
>
> real    0m0,871s
> user    0m0,028s
> sys     0m0,116s
>
> vs.
>
> Summary:
> passed   360
> failed   0
> broken   0
> skipped  0
> warnings 0
>
> real    0m0,387s
> user    0m0,016s
> sys     0m0,122s
>
> # time ./fanotify19 -i10
> Summary:
> passed   160
> failed   0
> broken   0
> skipped  0
> warnings 0
>
> real    0m0,436s
> user    0m0,032s
> sys     0m0,128s
>
> vs.
>
> Summary:
> passed   160
> failed   0
> broken   0
> skipped  0
> warnings 0
>
> real    0m0,876s
> user    0m0,052s
> sys     0m0,105s

--000000000000c68b5a05c725c5d2
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-syscalls-fanotify-Closing-group-fd-in-batches.patch"
Content-Disposition: attachment; 
	filename="0001-syscalls-fanotify-Closing-group-fd-in-batches.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kr4oql7s0>
X-Attachment-Id: f_kr4oql7s0

RnJvbSA2NGM5OGYyZTBlMDVmODFhZmJmZjQyZDAyMGJkYzA1MTQxNTM4YWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpE
YXRlOiBUaHUsIDE1IEp1bCAyMDIxIDExOjE2OjM5ICswMzAwClN1YmplY3Q6IFtQQVRDSF0gc3lz
Y2FsbHMvZmFub3RpZnk6IENsb3NpbmcgZ3JvdXAgZmQgaW4gYmF0Y2hlcwoKSXQgYW1vcnRpemVz
IFNSQ1Ugd2FpdHMgb24gZ3JvdXAgZGVzdHJ1Y3Rpb24gd2hpY2ggY2FuIGJlIHRpbWUKY29uc3Vt
aW5nIHdoZW4gcnVubmluZyB0ZXN0IGluIGEgbG9vcC4KClNpZ25lZC1vZmYtYnk6IEFtaXIgR29s
ZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Ci0tLQogLi4uL2tlcm5lbC9zeXNjYWxscy9mYW5v
dGlmeS9mYW5vdGlmeTE4LmMgICAgIHwgNTUgKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxOC5jIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE4LmMKaW5kZXggNTRhNGI4YmEwLi4x
ZmNkNWM0MGEgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkv
ZmFub3RpZnkxOC5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFu
b3RpZnkxOC5jCkBAIC00Miw3ICs0MiwxMCBAQAogI2RlZmluZSBNT1VOVF9QQVRICSJmc19tbnQi
CiAjZGVmaW5lIFRFU1RfRklMRQlNT1VOVF9QQVRIICIvdGVzdGZpbGUiCiAKLXN0YXRpYyBpbnQg
ZmRfbm90aWZ5OworI2RlZmluZSBNQVhfRkFOT1RJRllfRkRTIDEwMAorCitzdGF0aWMgaW50IGZh
bm90aWZ5X2Zkc1tNQVhfRkFOT1RJRllfRkRTXTsKK3N0YXRpYyBpbnQgZmFub3RpZnlfZmRpOwog
CiBzdGF0aWMgc3RydWN0IHRlc3RfY2FzZV90IHsKIAljb25zdCBjaGFyICpuYW1lOwpAQCAtODEs
MjkgKzg0LDM5IEBAIHN0YXRpYyBzdHJ1Y3QgdGVzdF9jYXNlX3QgewogCQkwLCAwCiAJfSwKIAl7
Ci0JCSJpbml0X2ZsYWdzOiBGQU5fQ0xBU1NfTk9USUYsICIKLQkJIm1hcmtfZmxhZ3M6IEZBTl9N
QVJLX0FERCB8IEZBTl9NQVJLX01PVU5UIiwKKwkJImluaXRfZmxhZ3M6IEZBTl9DTEFTU19OT1RJ
RiwgbWFya19mbGFnczogRkFOX01BUktfTU9VTlQiLAogCQlGQU5PVElGWV9SRVFVSVJFRF9VU0VS
X0lOSVRfRkxBR1MgfCBGQU5fQ0xBU1NfTk9USUYsCi0JCUZBTl9NQVJLX0FERCB8IEZBTl9NQVJL
X01PVU5ULCBGQU5fQUxMX0VWRU5UUworCQlGQU5fTUFSS19NT1VOVCwgRkFOX0FMTF9FVkVOVFMK
IAl9LAogCXsKLQkJImluaXRfZmxhZ3M6IEZBTl9DTEFTU19OT1RJRiwgIgotCQkibWFya19mbGFn
czogRkFOX01BUktfQUREIHwgRkFOX01BUktfRklMRVNZU1RFTSIsCisJCSJpbml0X2ZsYWdzOiBG
QU5fQ0xBU1NfTk9USUYsIG1hcmtfZmxhZ3M6IEZBTl9NQVJLX0ZJTEVTWVNURU0iLAogCQlGQU5P
VElGWV9SRVFVSVJFRF9VU0VSX0lOSVRfRkxBR1MgfCBGQU5fQ0xBU1NfTk9USUYsCi0JCUZBTl9N
QVJLX0FERCB8IEZBTl9NQVJLX0ZJTEVTWVNURU0sIEZBTl9BTExfRVZFTlRTCisJCUZBTl9NQVJL
X0ZJTEVTWVNURU0sIEZBTl9BTExfRVZFTlRTCiAJfSwKIAl7Ci0JCSJpbml0X2ZsYWdzOiBGQU5f
Q0xBU1NfTk9USUYsICIKLQkJIm1hcmtfZmxhZ3M6IEZBTl9NQVJLX0FERCwgIgotCQkibWFya19t
YXNrOiBGQU5fQUxMX0VWRU5UUyIsCisJCSJpbml0X2ZsYWdzOiBGQU5fQ0xBU1NfTk9USUYsIG1h
cmtfZmxhZ3M6IEZBTl9NQVJLX0lOT0RFIiwKIAkJRkFOT1RJRllfUkVRVUlSRURfVVNFUl9JTklU
X0ZMQUdTIHwgRkFOX0NMQVNTX05PVElGLAotCQlGQU5fTUFSS19BREQsIEZBTl9BTExfRVZFTlRT
CisJCUZBTl9NQVJLX0lOT0RFLCBGQU5fQUxMX0VWRU5UUwogCX0KIH07CiAKK3N0YXRpYyB2b2lk
IGNsZWFudXBfZmFub3RpZnlfZmRzKHZvaWQpCit7CisJaW50IGk7CisKKwl0c3RfcmVzKFRJTkZP
LCAiQ2xlYW51cCAlZCBmYW5vdGlmeSBmZHMiLCBmYW5vdGlmeV9mZGkpOworCWZvciAoaSA9IDA7
IGkgPCBNQVhfRkFOT1RJRllfRkRTOyBpKyspIHsKKwkJaWYgKGZhbm90aWZ5X2Zkc1tpXSkKKwkJ
CVNBRkVfQ0xPU0UoZmFub3RpZnlfZmRzW2ldKTsKKwkJZmFub3RpZnlfZmRzW2ldID0gMDsKKwl9
CisJZmFub3RpZnlfZmRpID0gMDsKK30KKwogc3RhdGljIHZvaWQgdGVzdF9mYW5vdGlmeSh1bnNp
Z25lZCBpbnQgbikKIHsKIAlzdHJ1Y3QgdGVzdF9jYXNlX3QgKnRjID0gJnRlc3RfY2FzZXNbbl07
CisJaW50IGZkX25vdGlmeTsKIAogCXRzdF9yZXMoVElORk8sICJUZXN0ICMlZCAlcyIsIG4sIHRj
LT5uYW1lKTsKIApAQCAtMTI1LDkgKzEzOCwxNSBAQCBzdGF0aWMgdm9pZCB0ZXN0X2Zhbm90aWZ5
KHVuc2lnbmVkIGludCBuKQogCQl9CiAJfQogCisJLyogQ2xvc2UgZmFub3RpZnkgZmRzIGluIGJh
dGNoZXMgb2YgTUFYX0ZBTk9USUZZX0ZEUyAqLworCWlmICgrK2Zhbm90aWZ5X2ZkaSA+PSBNQVhf
RkFOT1RJRllfRkRTKQorCQljbGVhbnVwX2Zhbm90aWZ5X2ZkcygpOworCisJZmFub3RpZnlfZmRz
W2Zhbm90aWZ5X2ZkaV0gPSBmZF9ub3RpZnk7CisKIAkvKiBBdHRlbXB0IHRvIHBsYWNlIG1hcmsg
b24gb2JqZWN0ICovCi0JaWYgKGZhbm90aWZ5X21hcmsoZmRfbm90aWZ5LCB0Yy0+bWFya19mbGFn
cywgdGMtPm1hcmtfbWFzaywgQVRfRkRDV0QsCi0JCQkJVEVTVF9GSUxFKSA8IDApIHsKKwlpZiAo
ZmFub3RpZnlfbWFyayhmZF9ub3RpZnksIEZBTl9NQVJLX0FERCB8IHRjLT5tYXJrX2ZsYWdzLAor
CQkJICB0Yy0+bWFya19tYXNrLCBBVF9GRENXRCwgVEVTVF9GSUxFKSA8IDApIHsKIAkJLyoKIAkJ
ICogVW5wcml2aWxlZ2VkIHVzZXJzIGFyZSBvbmx5IGFsbG93ZWQgdG8gbWFyayBpbm9kZXMgYW5k
IG5vdAogCQkgKiBwZXJtaXR0ZWQgdG8gdXNlIGFjY2VzcyBwZXJtaXNzaW9ucwpAQCAtMTM2LDcg
KzE1NSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfZmFub3RpZnkodW5zaWduZWQgaW50IG4pCiAJCQko
dGMtPm1hcmtfZmxhZ3MgJiBESVNBTExPV0VEX01BUktfRkxBR1MgfHwKIAkJCSB0Yy0+bWFya19t
YXNrICYgRkFOX0FMTF9QRVJNX0VWRU5UUykpIHsKIAkJCXRzdF9yZXMoVFBBU1MsICJSZWNlaXZl
ZCByZXN1bHQgRVBFUk0sIGFzIGV4cGVjdGVkIik7Ci0JCQlnb3RvIG91dDsKKwkJCXJldHVybjsK
IAkJfQogCiAJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sCkBAIC0xNTIsOCArMTcxLDkgQEAgc3Rh
dGljIHZvaWQgdGVzdF9mYW5vdGlmeSh1bnNpZ25lZCBpbnQgbikKIAkJImZhbm90aWZ5X2luaXQo
KSBhbmQgZmFub3RpZnlfbWFyaygpIHJldHVybmVkIHN1Y2Nlc3NmdWxseSwgIgogCQkiYXMgZXhw
ZWN0ZWQiKTsKIAotb3V0OgotCVNBRkVfQ0xPU0UoZmRfbm90aWZ5KTsKKwkvKiBJdCBpcyBtb3Jl
IGVmZmljaWVudCB0byBmbHVzaCBtYXJrcyBub3cgYW5kIGNsb3NlIGdyb3VwIGZkcyBsYXRlciAq
LworCVNBRkVfRkFOT1RJRllfTUFSSyhmZF9ub3RpZnksIEZBTl9NQVJLX0ZMVVNIIHwgdGMtPm1h
cmtfZmxhZ3MsIDAsCisJCQkgICBBVF9GRENXRCwgVEVTVF9GSUxFKTsKIH0KIAogc3RhdGljIHZv
aWQgc2V0dXAodm9pZCkKQEAgLTE4NCw4ICsyMDQsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQogCiBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCiB7Ci0JaWYgKGZkX25vdGlmeSA+IDApCi0J
CVNBRkVfQ0xPU0UoZmRfbm90aWZ5KTsKKwljbGVhbnVwX2Zhbm90aWZ5X2ZkcygpOwogfQogCiBz
dGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Ci0tIAoyLjMyLjAKCg==
--000000000000c68b5a05c725c5d2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--000000000000c68b5a05c725c5d2--
