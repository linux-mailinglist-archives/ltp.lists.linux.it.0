Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2104CFB7
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 15:57:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 585E72988EE
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 15:57:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 454E12987AF
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 15:57:51 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7AC1A6001B2
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 15:57:50 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id b143so1204999ywb.7
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dCcGhdj5fy8x8iFvCHNtHAyLIv3fDPlMQ9V8cUWOHsI=;
 b=tyReE5+BKhp5Cey5lPN+FdoPnmWlJsvWK8ehIDlPwVVsyhvPi07HFexh54tMZhpQMA
 KSOztNbPy3AmLDqhaOaroPOLsJQd3vNQSp7iT/nMHuGd3wQJjqSLUlZLlV+2P9sQ0WI+
 SGTB3zG5228oGiOgrewPQ/jk1s8opYxRjc9dAKi2SCWSH382z5QjYpRLoBjNOKBsQgnH
 ftYrIZAoLBD/CDagZAyEIJptWDO4LT+thqRauH9NFguIyvaWaxpWue6s6moM9Bi/VSEj
 ub8zSIVagIbO4mtxa6O8WphVNGaVjGXoSrAg6OnwEx4TAIAnWzHwfzFBnX1HwI0gnzE1
 iVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dCcGhdj5fy8x8iFvCHNtHAyLIv3fDPlMQ9V8cUWOHsI=;
 b=grqmb4pUqiB/NNfy2+msbIvcAtq5ZXQ/UFjqgMPitjm4G/xI7rdZcRzpEA6Z56fD65
 Nl/2q+CMZ572gcdN43KqfArvZS+pxU+/J1nW9CGZ9RcdSfItYNcG0ad3wMMtEZtf+z80
 I83Ss+DIpZQWUMbjWqUNo16E2fiCRp50R/UbGgMpU+mR2cQ6m3cMV67SWZXW5r7X+mnD
 onjnnNbvVlkE5qejnB3gD6VmResu3ewm2UMg700wgIo6r2TZttTkRqxSxztFM6uJJf58
 UiVfscdjSNAcmGKBK59gFJvnPy51QVRiTFmP0A588QrFsg/82n7/wAeJHuzt4bHKPqoD
 vpvQ==
X-Gm-Message-State: APjAAAV6O4LJU6Y8a7uAvZyE4y87m2yRYJUZ2cu6eD8pQGtCr3CKZDQv
 DDXrsUfXOun3n1ybmShfuYkcZuwpkABcqtec76Yk7A==
X-Google-Smtp-Source: APXvYqwp8S8vDT6oczQn59wg8Hht4S+RBGZ5kVnB61/zRNy1e+Y4nBN50urPSXeIdPJ8pHAfjDF6opcx5Uq6u3Putzc=
X-Received: by 2002:a0d:db13:: with SMTP id d19mr52524275ywe.25.1561039069330; 
 Thu, 20 Jun 2019 06:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561018312.git.mbobrowski@mbobrowski.org>
 <20190620132436.GA9804@dell5510>
In-Reply-To: <20190620132436.GA9804@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 20 Jun 2019 16:57:37 +0300
Message-ID: <CAOQ4uxjd8pvCpAHJ9Z9twY=EEvf9FNS3cycCZvHKhSN2JzY1Yw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Content-Type: multipart/mixed; boundary="000000000000356ab1058bc1bbed"
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v5 0/4] syscalls/fanotify: FAN_REPORT_FID and
 Directory Modification Events
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

--000000000000356ab1058bc1bbed
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 4:24 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir, Matthew,
>
> LGTM. Just one of this commits fails on centos 6

Hi Petr,

Can you please try attached patch.

Thanks,
Amir.

--000000000000356ab1058bc1bbed
Content-Type: text/plain; charset="US-ASCII"; 
	name="ltp-fanotify-fix-build-errors-on-centos-6.patch.txt"
Content-Disposition: attachment; 
	filename="ltp-fanotify-fix-build-errors-on-centos-6.patch.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jx4qcjc60>
X-Attachment-Id: f_jx4qcjc60

RnJvbSA3ZDBmZWI3ZDdkOTY3N2NmMzQ4NjQzYmRkZjEwNTA3ZDJkMWYwYzNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpE
YXRlOiBUaHUsIDIwIEp1biAyMDE5IDE2OjUzOjQ2ICswMzAwClN1YmplY3Q6IFtQQVRDSF0gc3lz
Y2FsbHMvZmFub3RpZnk6IGZpeCBidWlsZCBlcnJvcnMgb24gY2VudG9zIDYKClNpZ25lZC1vZmYt
Ynk6IEFtaXIgR29sZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Ci0tLQogdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeS5oIHwgMjIgKysrKysrKysrKystLS0tLS0t
LQogLi4uL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTEzLmMgICAgIHwgIDIgKy0K
IC4uLi9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxNS5jICAgICB8ICAyICstCiAz
IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkuaCBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkuaAppbmRleCBmOTgwM2Mx
Y2MuLjA1YjRkOWYyYyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5v
dGlmeS9mYW5vdGlmeS5oCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkv
ZmFub3RpZnkuaApAQCAtMTI1LDIxICsxMjUsMjUgQEAgc3RydWN0IGZhbm90aWZ5X2V2ZW50X2lu
Zm9faGVhZGVyIHsKIAl1aW50MTZfdCBsZW47CiB9OwogCit0eXBlZGVmIHN0cnVjdCB7CisgICAg
ICAgIGludCAgICAgdmFsWzJdOworfSBsdHBfZnNpZF90OworCiBzdHJ1Y3QgZmFub3RpZnlfZXZl
bnRfaW5mb19maWQgewogCXN0cnVjdCBmYW5vdGlmeV9ldmVudF9pbmZvX2hlYWRlciBoZHI7Ci0J
X19rZXJuZWxfZnNpZF90IGZzaWQ7CisJbHRwX2ZzaWRfdCBmc2lkOwogCXVuc2lnbmVkIGNoYXIg
aGFuZGxlWzBdOwogfTsKIAogI2VuZGlmCiAKKyNpZmRlZiBIQVZFX05BTUVfVE9fSEFORExFX0FU
CiAvKgotICogSGVscGVyIGZ1bmN0aW9uIHVzZWQgdG8gb2J0YWluIF9fa2VybmVsX2ZzaWRfdCBh
bmQgZmlsZV9oYW5kbGUgb2JqZWN0cwotICogZm9yIGEgZ2l2ZW4gcGF0aC4gVXNlZCBieSB0ZXN0
IGZpbGVzIGNvcnJlbGF0ZWQgdG8gRkFOX1JFUE9SVF9GSUQKLSAqIGZ1bmN0aW9uYWxpdHkuCisg
KiBIZWxwZXIgZnVuY3Rpb24gdXNlZCB0byBvYnRhaW4gZnNpZCBhbmQgZmlsZV9oYW5kbGUgZm9y
IGEgZ2l2ZW4gcGF0aC4KKyAqIFVzZWQgYnkgdGVzdCBmaWxlcyBjb3JyZWxhdGVkIHRvIEZBTl9S
RVBPUlRfRklEIGZ1bmN0aW9uYWxpdHkuCiAgKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBmYW5vdGlm
eV9nZXRfZmlkKGNvbnN0IGNoYXIgKnBhdGgsIF9fa2VybmVsX2ZzaWRfdCAqZnNpZCwKLQkJCXN0
cnVjdCBmaWxlX2hhbmRsZSAqaGFuZGxlKQorc3RhdGljIGlubGluZSB2b2lkIGZhbm90aWZ5X2dl
dF9maWQoY29uc3QgY2hhciAqcGF0aCwgbHRwX2ZzaWRfdCAqZnNpZCwKKwkJCQkgICAgc3RydWN0
IGZpbGVfaGFuZGxlICpoYW5kbGUpCiB7CiAJaW50IG1vdW50X2lkOwogCXN0cnVjdCBzdGF0ZnMg
c3RhdHM7CkBAIC0xNDksNyArMTUzLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGZhbm90aWZ5X2dl
dF9maWQoY29uc3QgY2hhciAqcGF0aCwgX19rZXJuZWxfZnNpZF90ICpmc2lkLAogCQkJInN0YXRm
cyglcywgLi4uKSBmYWlsZWQiLCBwYXRoKTsKIAltZW1jcHkoZnNpZCwgJnN0YXRzLmZfZnNpZCwg
c2l6ZW9mKHN0YXRzLmZfZnNpZCkpOwogCi0jaWZkZWYgSEFWRV9OQU1FX1RPX0hBTkRMRV9BVAog
CWlmIChuYW1lX3RvX2hhbmRsZV9hdChBVF9GRENXRCwgcGF0aCwgaGFuZGxlLCAmbW91bnRfaWQs
IDApID09IC0xKSB7CiAJCWlmIChlcnJubyA9PSBFT1BOT1RTVVBQKSB7CiAJCQl0c3RfYnJrKFRD
T05GLApAQCAtMTU5LDEwICsxNjIsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIGZhbm90aWZ5X2dl
dF9maWQoY29uc3QgY2hhciAqcGF0aCwgX19rZXJuZWxfZnNpZF90ICpmc2lkLAogCQl0c3RfYnJr
KFRCUk9LIHwgVEVSUk5PLAogCQkJIm5hbWVfdG9faGFuZGxlX2F0KEFUX0ZEQ1dELCAlcywgLi4u
KSBmYWlsZWQiLCBwYXRoKTsKIAl9Cit9CiAjZWxzZQotCXRzdF9icmsoVENPTkYsICJuYW1lX3Rv
X2hhbmRsZV9hdCgpIGlzIG5vdCBpbXBsbWVudGVkIik7CisjZGVmaW5lIGZhbm90aWZ5X2dldF9m
aWQocGF0aCwgZnNpZCwgaGFuZGxlKSBcCisJdHN0X2JyayhUQ09ORiwgIlN5c3RlbSBkb2VzIG5v
dCBoYXZlIHJlcXVpcmVkIG5hbWVfdG9faGFuZGxlX2F0KCkgc3VwcG9ydCIpCiAjZW5kaWYgLyog
SEFWRV9OQU1FX1RPX0hBTkRMRV9BVCAqLwotfQogCiAjZGVmaW5lIElOSVRfRkFOT1RJRllfTUFS
S19UWVBFKHQpIFwKIAl7IEZBTl9NQVJLXyAjIyB0LCAiRkFOX01BUktfIiAjdCB9CmRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxMy5jCmluZGV4IDhmOWJh
YWNmYS4uZjc5MzIyZmQwIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zh
bm90aWZ5L2Zhbm90aWZ5MTMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90
aWZ5L2Zhbm90aWZ5MTMuYwpAQCAtNDAsNyArNDAsNyBAQAogCiBzdHJ1Y3QgZXZlbnRfdCB7CiAJ
dW5zaWduZWQgbG9uZyBsb25nIGV4cGVjdGVkX21hc2s7Ci0JX19rZXJuZWxfZnNpZF90IGZzaWQ7
CisJbHRwX2ZzaWRfdCBmc2lkOwogCXN0cnVjdCBmaWxlX2hhbmRsZSBoYW5kbGU7CiAJY2hhciBi
dWZbTUFYX0hBTkRMRV9TWl07CiB9OwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zh
bm90aWZ5L2Zhbm90aWZ5MTUuYwppbmRleCA2OTgxYjc4OTEuLjNiZTkxM2JhNCAxMDA2NDQKLS0t
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMKKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMKQEAgLTM3LDcg
KzM3LDcgQEAKIAogc3RydWN0IGV2ZW50X3QgewogCXVuc2lnbmVkIGxvbmcgbG9uZyBtYXNrOwot
CV9fa2VybmVsX2ZzaWRfdCBmc2lkOworCWx0cF9mc2lkX3QgZnNpZDsKIAlzdHJ1Y3QgZmlsZV9o
YW5kbGUgaGFuZGxlOwogCWNoYXIgYnVmW01BWF9IQU5ETEVfU1pdOwogfTsKLS0gCjIuMTcuMQoK
--000000000000356ab1058bc1bbed
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--000000000000356ab1058bc1bbed--
