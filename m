Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A92994CEAE
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 15:30:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A59C3EB00B
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 15:30:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4061A3EAB2A
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 15:30:45 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A5DE620109F
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 15:30:44 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id b143so1167045ywb.7
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jNbfkpHieS+Qh0UNvJ+SGqIXjKIvzAlZuELsq3yzmH4=;
 b=UfDr9yTv/+r4BEV0NJVqwklfFK/2/+hSgP5G31Cjfd2jVuXHB+m3RU42c0oL2F+9Ft
 rCl3SuLYQlv3gF6BUFYZwr3wTCvjrmY8kiBuLHmO/fy0v+qMW0iB5gfQNw9YcGQDaop3
 P5hS5yAbwv7yEpw2Obz4LsbeBQyFF8DEP1YmIf2cWn70lu/4/K3bG1XB6lxE++piQa06
 SbwEVJLpfA53ptPKBLX7Rd45ROH3a+JfwrEQUdAkUq4mf5SIaDbEhHIujzzjnVDbqUwk
 ylCINlJN9wFEVZmeDHEwZCQuhJhX4kk81URVstPSKMErf7Zh0XQLEGK9ht+ia48X067/
 7PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jNbfkpHieS+Qh0UNvJ+SGqIXjKIvzAlZuELsq3yzmH4=;
 b=PjDR4hMxICOw/BgHgmyANX39Gk9DwUTWBqiS3N0usK98CydNs/W2nX9+B8Fpl84Ra7
 8ICxbemjv1BHd76gJXBd0PbhlIc8g03+bCScUSarZJIxqVv70ubaAy1G5i8VihOV+Qeh
 MwETTfO0QMj6zbtIcDep0EHly4GZkES4FaMtq//jfn7QVi/Khfsow8GdISo24P/XiqYm
 X38xgmMEz4C7DVlmqEFstfO3zEAEJJKb8QZtV/micItdWJV7spXnzXgAPhsZsMy+i0mT
 upDsbkzeExE1MAWpeAY1KjlVjcCAWqrLA/MnLveuhMMx7zQCcRFKcntEqGcbEWl8Lj1N
 lyHA==
X-Gm-Message-State: APjAAAU0JxWZugjHUudYQzhYD2f0cbAqcg/wmsF7W78OOjnigpLEVttb
 b4J5TzbFv8WFyzbw9n3BjWbYp98RqvtLguONrEQ=
X-Google-Smtp-Source: APXvYqyW3q+G1HFDA1fiy5gRNKSDuRSkbExQPCW42ogiS8SVdPwiWVgqwN1TrFha3yrfF10xfY8QUQ86AK6je6HSSjo=
X-Received: by 2002:a81:7096:: with SMTP id
 l144mr75405522ywc.294.1561037443493; 
 Thu, 20 Jun 2019 06:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190619124707.2981-1-amir73il@gmail.com>
 <20190619142338.GA30900@rei.lan>
In-Reply-To: <20190619142338.GA30900@rei.lan>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 20 Jun 2019 16:30:31 +0300
Message-ID: <CAOQ4uxi4L799rLLKQcVcChk5vM0RtgsjKzgH6iXNeMv7bXos0Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/getxattr05: skip userns test cases when
	not supported
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgNToyMyBQTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4gd3JvdGU6Cj4KPiBIaSEKPiBQdXNoZWQsIHRoYW5rcy4KCkZZSSwgc29tZSBtb3JlIGZh
bHNlIHBvc2l0aXZlIGZhaWx1cmVzIEkgcmFuIGludG8uCkkndmUgcHV0IHRoZW0gaW4gbXkgc2tp
cCBsaXN0LCBpZiBzb21lYm9keSBoYXMgdGltZSB0byBmaXggdGhlbS4uLgoKaW9jdGxfbnMwNCBh
bmQgaW9jdGxfbnMwNiBhbHNvIGZhaWwgd2hlbiBDT05GSUdfVVNFUl9OUyBpcyBub3QgZGVmaW5l
ZDoKCmlvY3RsX25zMDQuYzoyNDogQ09ORjogbmFtZXNwYWNlIG5vdCBhdmFpbGFibGUKc2FmZV9t
YWNyb3MuYzoyMjU6IEJST0s6IGlvY3RsX25zMDQuYzozMToKb3BlbigvcHJvYy9zZWxmL25zL3Vz
ZXIsMCwwMzQ2NDE2NDQ0MTApIGZhaWxlZDogRU5PRU5UCgpvb20wMyBhbmQgb29tMDUgZmFpbCB3
aGVuIENPTkZJR19NRU1DRyBpcyBub3QgZGVmaW5lZDoKCm1lbS5jOjc1NzogQlJPSzogbW91bnQg
L2Rldi9jZ3JvdXA6IEVOT0VOVAoKQW5kIGFsc28gZG9lcyBub3QgY2xlYW51cCAvZGV2L2Nncm91
cCBhZnRlcndhcmRzLCBzbyBlcnJvciB0aGVtIGJlY29tZXM6CgpzYWZlX21hY3Jvcy5jOjE2OTog
QlJPSzogbWVtLmM6NzQ3OiBta2RpcigvZGV2L2Nncm91cCwwNzc3KSBmYWlsZWQ6IEVFWElTVAoK
VGhhbmtzLApBbWlyLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
