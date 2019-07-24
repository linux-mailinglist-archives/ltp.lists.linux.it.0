Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6B72E4C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 13:58:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FB2D3C1D19
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 13:58:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 19A8B3C18F5
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 12:43:46 +0200 (CEST)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A2C9D1A013D2
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 12:43:46 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id g67so37055316wme.1
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 03:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:savedfromemail:date:subject:importance:from:to
 :mime-version; bh=UX3gAvvgdHG64P1F4ssRaJVEf/xlHeEKTSnADZQivHc=;
 b=mGjhlsTTxc6Kn8qUlnhnVKBsjvGnPTfibCiW2WQfmzSpEFxnY6BDSoqBgKVMnpy3sD
 KzRJZL2blQ3VN//UBpne5WslF/7Ef6dq46ydZqeVWycjE8PtYcC9iSLuL30Y5EojqsA7
 NwF5CGS0fUdcz5eFOnv/Hkm7GScBspGl16ceMilULbnthDhLh4crNPfuv9xvfh1SRyZT
 UbxhD4bM8xeSQWE4Rgm0s/1hljbwFJHTtQ8bltvpwmzYw3FRJEfs00aoHRI7aZ9AFaXc
 rJ6dsQ5Dtza1iDTNnlETUJtQOsT9hWlod3cUyZjR9Ti6mHS146MfZeEnEubFwmfpI5Os
 yJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:savedfromemail:date:subject
 :importance:from:to:mime-version;
 bh=UX3gAvvgdHG64P1F4ssRaJVEf/xlHeEKTSnADZQivHc=;
 b=sSnyK+4L2su1kI+PyffwvxHQgtmLt99CJ8wYBZNIXpNnDsH8nZ4/lavcyQ6x582sr6
 Kt51UrLM/432SW45Ju0xIY956Pt3Vrhlp99KovRnLL379dBYBmNOxihTJHfZFruNojxm
 tVsHFxc9rCTG0VLDaRxp3pNqfVYOuq+KClsBFxFpZETRRMyEILIRvgfXULnc89a6VgWb
 7Ecxn4boERal6ZzA2e30m2OHefPE38Hq86rPrWegCAtnk4/Jqwj9MQGP28DN77cKt13N
 3eZXICxVYINChPEZvruHQMtg4kC71xU+AAXv6Rfkz2ZZaX6t/egHoet/c+exG2cInxBK
 Qy6g==
X-Gm-Message-State: APjAAAWRSK22hYyMZBgnD5AsSq1khr3y3etKkzgVJ+0QKdfUt4R9YxBN
 71sI0+almuReGKa6DepExYrIS4oT
X-Google-Smtp-Source: APXvYqyqxYaLiDZNijFSDGB3H/2fP35tv6n4pveJCK20wOr6bWEyL24b840U7VH1ayik4StVzi2BRw==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr58391147wmf.166.1563965026059; 
 Wed, 24 Jul 2019 03:43:46 -0700 (PDT)
Received: from ?IPv6:2a00:f41:1c3b:1a2d:a8a2:ecd3:4a64:1fc0?
 ([2a00:f41:1c3b:1a2d:a8a2:ecd3:4a64:1fc0])
 by smtp.gmail.com with ESMTPSA id o11sm42289892wmh.37.2019.07.24.03.43.45
 for <ltp@lists.linux.it>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 03:43:45 -0700 (PDT)
Message-ID: <5d383661.1c69fb81.3d170.b9f8@mx.google.com>
SavedFromEmail: piotr.krzysztof.gawel@gmail.com
Date: Wed, 24 Jul 2019 12:43:42 +0200
Importance: normal
From: "piotr.krzysztof.gawel" <piotr.krzysztof.gawel@gmail.com>
To: ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--_com.samsung.android.email_2651059222849940"
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, HTML_TAG_BALANCE_BODY,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 24 Jul 2019 13:58:23 +0200
Subject: [LTP] Patch for LTP
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

----_com.samsung.android.email_2651059222849940
Content-Type: multipart/alternative; boundary="--_com.samsung.android.email_2651059228254171"

----_com.samsung.android.email_2651059228254171
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

RGVhciBMVFAgY29tbXVuaXR5LApXaGVuIEkgcnVuIExUUCB0ZXN0cyB3aXRoIG11c2wgbGliYywg
SSBkaXNjb3ZlcmVkIGZldyBpc3N1ZXMgaW4gdHN0X3RpbWVyX3Rlc3QuYzoKClRoZSBhcnJheSB3
aXRoIHJ1biB0aW1lcyB3YXMgbm90IHNvcnRlZC4gQXMgUmljaCBGZWxrZXIgcG9pbnRlZCBvdXQs
IGNtcCgpIGZ1bmN0aW9uIGJyZWFrcyB0aGUgY29udHJhY3QgZm9yIHFzb3J0KCkg4oCTIEkgZml4
ZWQgaXQuQmVjYXVzZSBhcnJheSB3YXMgbm90IHNvcnRlZCwgc29tZSB0ZXN0cyB3ZXJlIGR1bXBp
bmcgY29yZXMuIFBsb3R0aW5nIGZ1bmN0aW9uIHN0cm9uZ2x5IHJlbGllcyBvbiBoYXZpbmcgYXJy
YXkgc29ydGVkLiBJIGZpeGVkIHRoYXQgaW4gIzEgYnV0IHN0aWxsIHByZWZlciBkZWZlbnNpdmUK
IHByb2dyYW1taW5nIGhlcmUg4oCTIHByb3RlY3QgYWdhaW5zdCBidWZmZXIgb3ZlcmZsb3cgaS5l
LiB3aGVuIGlucHV0IGRhdGEgaXMgaW5jb3JyZWN0LkNhbGN1bGF0aW9uIGlmIGF2ZXJhZ2UgcnVu
IHRpbWUgaXMgZ3JlYXRlciB0aGFuIGRlc2lyZWQgdGltZSArIHRocmVzaG9sZCB3YXMgaW5jb3Jy
ZWN0LiBFYWNoIGV4cGVjdGVkIHJ1biBzaG91bGQgYmUgaW4gcmFuZ2UgdCA8IHNbaV0gPCB0ICsg
dGhyZXNob2xkLCBzbyBmb3IgbWF4LgogZWRnZTogc3VtKHNbaV0gKyB0aHJlc2hvbGQpIDwgc3Vt
KHQgKyB0aHJlc2hvbGQpLiBGb3IgaSBiZWxvbmdpbmcgdG8gW2Qsbl0gPT4gc3VtKHNbaV0pIDwg
KG4tZCkqKHQgKyB0aHJlc2hvbGQpIGFuZCBub3QgKG4tZCkqdCArIHRocmVzaG9sZC4KUGxlYXNl
IGFkZCB0aGlzIHBhdGNoIHRvIG1haW4gbGluZSBvZiBMVFAgaWYgeW91IGRvbuKAmXQgc2VlIGlz
c3VlcyBoZXJlLiBGZWVsIGZyZWUgdG8gbW9kaWZ5IHRoZSBjaGFuZ2UgaWYgbmVlZGVkLlRoYW5r
cyBpbiBhZHZhbmNlIQpLaW5kIHJlZ2FyZHMsUGlvdHIgR2F3ZWwKbnVsbA==

----_com.samsung.android.email_2651059228254171
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXYgZGlyPSJh
dXRvIj5EZWFyIExUUCBjb21tdW5pdHksPC9kaXY+PGRpdiBkaXI9ImF1dG8iPgo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+V2hlbiBJIHJ1biBMVFAgdGVzdHMgd2l0aCBt
dXNsIGxpYmMsIEkgZGlzY292ZXJlZCBmZXcgaXNzdWVzIGluIHRzdF90aW1lcl90ZXN0LmM6PG86
cD48L286cD48L3NwYW4+PC9wPgo8b2wgc3R5bGU9Im1hcmdpbi10b3A6MGluIiBzdGFydD0iMSIg
dHlwZT0iMSI+CjxsaSBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0
OjBpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+PHNwYW4gbGFuZz0iRU4tVVMiPlRoZSBhcnJh
eSB3aXRoIHJ1biB0aW1lcyB3YXMgbm90IHNvcnRlZC4gQXMgUmljaCBGZWxrZXIgcG9pbnRlZCBv
dXQsIGNtcCgpIGZ1bmN0aW9uIGJyZWFrcyB0aGUgY29udHJhY3QgZm9yIHFzb3J0KCkg4oCTIEkg
Zml4ZWQgaXQuPG86cD48L286cD48L3NwYW4+PC9saT48bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3Jh
cGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFu
IGxhbmc9IkVOLVVTIj5CZWNhdXNlIGFycmF5IHdhcyBub3Qgc29ydGVkLCBzb21lIHRlc3RzIHdl
cmUgZHVtcGluZyBjb3Jlcy4gUGxvdHRpbmcgZnVuY3Rpb24gc3Ryb25nbHkgcmVsaWVzIG9uIGhh
dmluZyBhcnJheSBzb3J0ZWQuIEkgZml4ZWQgdGhhdCBpbiAjMSBidXQgc3RpbGwgcHJlZmVyIGRl
ZmVuc2l2ZQogcHJvZ3JhbW1pbmcgaGVyZSDigJMgcHJvdGVjdCBhZ2FpbnN0IGJ1ZmZlciBvdmVy
ZmxvdyBpLmUuIHdoZW4gaW5wdXQgZGF0YSBpcyBpbmNvcnJlY3QuPG86cD48L286cD48L3NwYW4+
PC9saT48bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47
bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFuIGxhbmc9IkVOLVVTIj5DYWxjdWxhdGlvbiBp
ZiBhdmVyYWdlIHJ1biB0aW1lIGlzIGdyZWF0ZXIgdGhhbiBkZXNpcmVkIHRpbWUgKyB0aHJlc2hv
bGQgd2FzIGluY29ycmVjdC4gRWFjaCBleHBlY3RlZCBydW4gc2hvdWxkIGJlIGluIHJhbmdlIHQg
Jmx0OyBzW2ldICZsdDsgdCArIHRocmVzaG9sZCwgc28gZm9yIG1heC4KIGVkZ2U6IHN1bShzW2ld
ICsgdGhyZXNob2xkKSAmbHQ7IHN1bSh0ICsgdGhyZXNob2xkKS4gRm9yIGkgYmVsb25naW5nIHRv
IFtkLG5dID0mZ3Q7IHN1bShzW2ldKSAmbHQ7IChuLWQpKih0ICsgdGhyZXNob2xkKSBhbmQgbm90
IChuLWQpKnQgKyB0aHJlc2hvbGQuPC9zcGFuPjwvbGk+PC9vbD4KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gbGFuZz0iRU4tVVMiPlBsZWFzZSBhZGQgdGhpcyBwYXRjaCB0byBtYWluIGxpbmUg
b2YgTFRQIGlmIHlvdSBkb27igJl0IHNlZSBpc3N1ZXMgaGVyZS4gRmVlbCBmcmVlIHRvIG1vZGlm
eSB0aGUgY2hhbmdlIGlmIG5lZWRlZC5UaGFua3MgaW4gYWR2YW5jZSE8L3NwYW4+PC9wPgo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+S2luZCByZWdhcmRzLDwvc3Bhbj48
L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCI+UGlvdHIgR2F3ZWw8L3A+PC9kaXY+

----_com.samsung.android.email_2651059228254171--

----_com.samsung.android.email_2651059222849940
Content-Type: application/patch; name="ltp-fix-tst_timer-framework.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="ltp-fix-tst_timer-framework.patch";
 size=2262

RnJvbSA5ZTYzNDdkNGU0NjUxYzJjYzU5YTUyMGEyY2UzOGE4ZDEwZWMwYWI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQaW90ciBHYXdlbCA8cGlvdHIua3J6eXN6dG9mLmdhd2VsQGdt
YWlsLmNvbT4KRGF0ZTogV2VkLCAyNCBKdWwgMjAxOSAwODozNzoyOSArMDIwMApTdWJqZWN0OiBb
UEFUQ0hdIGx0cDogZml4IHRzdF90aW1lciBmcmFtZXdvcmsKClRoaXMgcGF0Y2ggZml4ZXM6Ci0g
Zm9ybXVsYSBvZiBjYWxjdWxhdGluZyBhdmVyYWdlIGV4ZWN1dGlvbiB0aW1lIGFuZCBjb21wYXJp
bmcKICBpdCB0byB0aGUgdGltZSBpbmNyZWFzZWQgYnkgdGhyZXNob2xkCi0gY29tcGFyaXNvbiBm
dW5jdGlvbiB1c2VkIGluIHFzb3J0KCkgLSBjdXJyZW50IGltcGxlbWVudGF0aW9uCiAgYnJlYWsg
YSBjb250cmFjdCBvZiBxc29ydCgpIGRlZmluaXRpb24KCkFkZGl0aW9uYWxseSwgdGhpcyBwYXRj
aCBhZGRzIHByb3RlY3Rpb24gYWdhaW5zdCBidWZmZXIKb3ZlcmZsb3cgaW4gY2FzZSBvZiBpbnZh
bGlkIGRhdGEgZHVyaW5nIHBsb3R0aW5nIChpLmUuIHdoZW4KYXJyYXkgaXMgbm90IHNvcnRlZCku
CgpTaWduZWQtb2ZmLWJ5OiBQaW90ciBHYXdlbCA8cGlvdHIua3J6eXN6dG9mLmdhd2VsQGdtYWls
LmNvbT4KLS0tCiBsaWIvdHN0X3RpbWVyX3Rlc3QuYyB8IDIwICsrKysrKysrKysrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9saWIvdHN0X3RpbWVyX3Rlc3QuYyBiL2xpYi90c3RfdGltZXJfdGVzdC5jCmluZGV4
IDc1MzljNjIuLmUyZWM2N2YgMTAwNjQ0Ci0tLSBhL2xpYi90c3RfdGltZXJfdGVzdC5jCisrKyBi
L2xpYi90c3RfdGltZXJfdGVzdC5jCkBAIC0xMDYsOCArMTA2LDkgQEAgc3RhdGljIHZvaWQgZnJl
cXVlbmN5X3Bsb3Qodm9pZCkKIAlidWNrZXRfc2l6ZSA9IE1BWCgxdSwgY2VpbHUoMS4wMCAqICht
YXhfc2FtcGxlIC0gbWluX3NhbXBsZSkvKHJvd3MtMSkpKTsKIAogCWZvciAoaSA9IDA7IGkgPCBj
dXJfc2FtcGxlOyBpKyspIHsKLQkJdW5zaWduZWQgaW50IGJ1Y2tldDsKLQkJYnVja2V0ID0gZmxv
b3J1KDEuMDAgKiAoc2FtcGxlc1tpXSAtIG1pbl9zYW1wbGUpL2J1Y2tldF9zaXplKTsKKwkJbG9u
ZyBsb25nIHNhbXBsZSA9IE1JTihzYW1wbGVzW2ldIC0gbWluX3NhbXBsZSwKKwkJCQkJbWF4X3Nh
bXBsZSAtIG1pbl9zYW1wbGUpOworCQl1bnNpZ25lZCBpbnQgYnVja2V0ID0gZmxvb3J1KDEuMDAg
KiBzYW1wbGUvYnVja2V0X3NpemUpOwogCQlidWNrZXRzW2J1Y2tldF0rKzsKIAl9CiAKQEAgLTE3
MCw3ICsxNzEsMTggQEAgc3RhdGljIGludCBjbXAoY29uc3Qgdm9pZCAqYSwgY29uc3Qgdm9pZCAq
YikKIHsKIAljb25zdCBsb25nIGxvbmcgKmFhID0gYSwgKmJiID0gYjsKIAotCXJldHVybiAqYWEg
PCAqYmI7CisJLyoKKwkqIEZyb20gcXNvcnQoKSBtYW51YWw6CisJKiAgICBUaGUgIGNvbXBhcmlz
b24gIGZ1bmN0aW9uIG11c3QgcmV0dXJuIGFuIGludGVnZXIKKwkqICAgIGxlc3MgdGhhbiwgZXF1
YWwgdG8sIG9yIGdyZWF0ZXIgdGhhbiB6ZXJvIGlmIHRoZQorCSogICAgZmlyc3QgYXJndW1lbnQg
aXMgY29uc2lkZXJlZCB0byBiZSByZXNwZWN0aXZlbHkKKwkqICAgIGxlc3MgdGhhbiwgZXF1YWwg
dG8sIG9yIGdyZWF0ZXIgdGhhbiB0aGUgc2Vjb25kLgorCSogICAgSWYgdHdvIG1lbWJlcnMgY29t
cGFyZSBhcyBlcXVhbCwgdGhlaXIgb3JkZXIgaW4KKwkqICAgIHRoZSBzb3J0ZWQgYXJyYXkgaXMg
dW5kZWZpbmVkLgorCSogV2UgbmVlZCBpdCBpbiBkZXNjZW5kaW5nIG9yZGVyIHNvIHRoZSBsb2dp
YyBpcworCSogcmV2ZXJ0ZWQuCisJKi8KKwlyZXR1cm4gKCpiYiAtICphYSk7CiB9CiAKIC8qCkBA
IC0zMTcsNyArMzI5LDcgQEAgdm9pZCBkb190aW1lcl90ZXN0KGxvbmcgbG9uZyB1c2VjLCB1bnNp
Z25lZCBpbnQgbnNhbXBsZXMpCiAJCXNhbXBsZXNbbnNhbXBsZXMtMV0sIHNhbXBsZXNbMF0sIG1l
ZGlhbiwKIAkJMS4wMCAqIHRydW5jX21lYW4gLyBrZWVwX3NhbXBsZXMsIGRpc2NhcmQpOwogCi0J
aWYgKHRydW5jX21lYW4gPiAobnNhbXBsZXMgLSBkaXNjYXJkKSAqIHVzZWMgKyB0aHJlc2hvbGQp
IHsKKwlpZiAodHJ1bmNfbWVhbiA+IGtlZXBfc2FtcGxlcyAqICh1c2VjICsgdGhyZXNob2xkKSkg
ewogCQl0c3RfcmVzKFRGQUlMLCAiJXMgc2xlcHQgZm9yIHRvbyBsb25nIiwgc2NhbGwpOwogCiAJ
CWlmICghcHJpbnRfZnJlcXVlbmN5X3Bsb3QpCi0tIAoyLjcuNAoK

----_com.samsung.android.email_2651059222849940
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

----_com.samsung.android.email_2651059222849940--

