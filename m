Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C5637AFC866
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jul 2025 12:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1751970489; h=date :
 mime-version : message-id : to : subject : list-id : list-unsubscribe
 : list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=N3LswcLNAmX2IJiRhAM5EU/IZT+l1Ds3O54l1l3hfDY=;
 b=BXADDr/MEd4jRFHnB9xajMdvg+wEaOQmokt/Y0aN6n4U/eLfzLV17FkonqYBtnsFTt6BV
 r2Cy6XuUkyr9VboOl6DxSOj80CAdscpAOnpeUT70bDOjn8M2q2MzZVpMa6A+/4H2UatuSBn
 rh0G5Ia3ndh/SkiAw1CHlx1Ti9a3qMs=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 759FA3CA403
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jul 2025 12:28:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E1C883C7A03
 for <ltp@lists.linux.it>; Tue,  8 Jul 2025 12:27:56 +0200 (CEST)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E9C5136E8E94
 for <ltp@lists.linux.it>; Tue,  8 Jul 2025 12:27:55 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so1956392f8f.2
 for <ltp@lists.linux.it>; Tue, 08 Jul 2025 03:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1751970475; x=1752575275; darn=lists.linux.it;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wpSB/vYUGA0D3J/E/IHz6j03+7TzxkmnAKxfl7PhYX0=;
 b=b36jJaq8nuIYVEnG6wQHKifQcxzCQNUjERHjCB2Fnd9kklGa5i+AAWXvfzh4bk9WAW
 by19npCjkNzH45+HeeGqFJS9V+WDbB4CnzdfC3cDue+S17MBtV6uC8y68iVX6Zv9Z99Z
 vcmpXgP+LVHE7FFEmpMDFEFsXKVHzdB6UDc2kABHhFa75tstdXpa8/B9Rm4DI5dGJPPy
 Sw+Ens3zRxADry31vB9QqzeH5UadTW7jdcI53aUbnN2hyLY7VfpTNi08lGFmVXVsoQoV
 6aHu1pSqoVOLluqsNIoI0sZkCKSriZJRkKXPTthgEYzwBICWFle71QFofWjuHan56pmg
 v73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751970475; x=1752575275;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpSB/vYUGA0D3J/E/IHz6j03+7TzxkmnAKxfl7PhYX0=;
 b=pUFe8tZufpZNmCbMonqXK7OlEHhDq+mRlULexTQ5aupqOieo2TbWxwA+3SPK1E/hHN
 NHNaurHVqq8oRCNvmij7dc2YK71tJokAWuhSmcn9AlBwHzzsJIfSVxaiNAMFDWZiY7fb
 GTcoca8Zmn0yCBdf0PdcnG8T6MDX1kCyZFzxcTDIsg6QSeZZxAd2MjIou0p21gX5wQud
 nUgEZbFAbX3X3oxGnoY2Kb7/BiZmOiVqEX5Cb/tXDGeDtXnbt2cy54Gc0FCtcaCMAWxs
 y/GxQldrby1jeiVk5cd8xs55oHNaYJZoTbkDuxTfB9e5xxNQBo3uX+zjI7UPWqiRZE1p
 BXmA==
X-Gm-Message-State: AOJu0Yw0qx/GBu08no0aaMRWPCMszqb9yFAxdyH379YbIiuYz3UmiWC+
 kvUKWNf01UJCBqyLjgx7bQ3yvsE52X3NqVFcoTE6iZDiXWWLX88V+dZpZ41Ts1oBgD/6/u7Kf8K
 V6iDk
X-Gm-Gg: ASbGncvTtB5LnI3ihh9PJiJ3M+tCbXsuYrRIfLUwPhgARtOCt0S0baAl/UCcf/8/B7k
 Cq1xR1gN1t2Tw7i+AwLF9Eb3OggT2EXk+uPd+wdLE8XQqqIw0qY6ZqkhkWIU4l61LzVtdyZdW/0
 +TG7a1TlmTPxI3B4rb5vPCrwz71IMSb8J3vJTdmUfCpYYlARyxUhQAdLpG31XlFWGwHNsVel1y9
 wheT4hMpzLCRdNF8Rv44ZXxvBY8Okx/Loh/ZSDL78/6asHLK4iWRSSR/JECRv3dS6Qwy4NkL3F0
 ZU94j+LPiFMUUZ1JHMSDrkFUXhsMIrag3xO7EJpzaP5UcDsgFw==
X-Google-Smtp-Source: AGHT+IFhWAM7akiacZlUJEa9SPZKEnFQcr/wcHSuJEsBBmu6zhz1aBPgXIT2RhX255vJVNcqe2VOAQ==
X-Received: by 2002:a05:6000:4a14:b0:3a4:f918:9db9 with SMTP id
 ffacd0b85a97d-3b4964def46mr12169821f8f.32.1751970474954; 
 Tue, 08 Jul 2025 03:27:54 -0700 (PDT)
Received: from localhost ([177.45.162.214])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-702c4d6505asm74021776d6.120.2025.07.08.03.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 03:27:53 -0700 (PDT)
Date: Tue, 08 Jul 2025 07:27:46 -0300
MIME-Version: 1.0
Message-Id: <20250708-new-munmap04-v4-1-884f774179b1@suse.com>
X-B4-Tracking: v=1; b=H4sIAKHybGgC/33NQQ6DIBQE0Ks0rEuDgKhd9R5NFx/8VhaiAbVtj
 HcvuDIm7XKSeTMLCegtBnI9LcTjbIPtXQzyfCKmBfdEauuYCWc8ZwWT1OGLdpPrYIgB8soAZ4C
 MGRLJ4LGx723u/ohZQ0CqPTjTppEOwog+FVsbxt5/tts5S/UfD3NGM6qwqVQmSs0qfgtTwIvpO
 5IOZv7P8milUKZkdRyQ6mDF3hYHK6JFgU0NJRY11zu7rusXZrFxuDgBAAA=
X-Change-ID: 20250704-new-munmap04-a59ca20ae00c
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4880; i=rbm@suse.com;
 h=from:subject:message-id; bh=Qp74f4M4P8k5MVnhLnPFdlYiHMMiijqE3wYqTHVYfow=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBobPKkABO34W21ZWdf+qjGyuJp0wp+rmMifWLrp
 nbHPxZlLsmJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCaGzypAAKCRDJC4p8Y4ZY
 ptwPD/9HQdad6HhYOu+FLn5TJH8cR3YHzfEBA5W9UZrqcTeD1OdimmYsk+yJo1njFYZK05kkjsw
 nbFpSYHXx9ifAWyHOczvNG0ZiQdRCp4YlHjuusPtdP12coAX/Qa9lRe0FsS8ctZtVMADCl2NnK4
 HpR965Voe40IQkyXBytU+HXKapFiL1GbpNENgXnInu/HxgxQXhxDSxz7nfLpzjsYz7ckZ56tPG9
 GKmuETEyZjz7Iyd5/r7lw9gw/yIr8GAkVZS8r4e6+dCvN/8nFLzAQYU14zgSLQjjoXWhTHqbIzs
 bsBPSDXbcJDsw0qPoWiSLcqmMmke/rYz6sXIXE+gBN2KJdKuNYGwb7qV2gMeRir0FF0K78gK1wA
 dz7iM96hvNNP8iZxdUNhjZQ3/Nfo/IfAPY/8vIn17p2yJ7O5tPT6b29xyQVpaWgHSBVgTZ1whhb
 EF51Txs0U3dr1gz62RipkcmGvKOuEWwhuEyt7JgM8HIWnIviu1TYQrtTLtZPJuNJiDZnehZLhoc
 Ltb5s65hHzsq3uy3MCfiplIqUVq5Dva+GeHSqTVsqujorq+ZkXgS56Yfcz1V60fOOu7ogK3+8iP
 emobdrwDiHhsod1B2aUshGEtrSguLorYbaDL+p2OzUtRA/LJ4yuj74d4EkkBxs2JPbP9GkUuk9z
 bNBtI/CaZkyoc1Q==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4] syscalls: munmap: Add munmap04 to check ENOMEM
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
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_via_ltp?= <ltp@lists.linux.it>
Reply-To: =?utf-8?B?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Cc: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

RnJvbTogUmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4KClRoZSBFUlJPUlMgc2Vj
dGlvbiBvZiB0aGUgbW1hcCgyKSBtYW5wYWdlIHNheXM6CgpFTk9NRU06IFRoZSBwcm9jZXNzJ3Mg
bWF4aW11bSBudW1iZXIgb2YgbWFwcGluZ3Mgd291bGQgaGF2ZSBiZWVuIGV4Y2VlZGVkLgpUaGlz
IGVycm9yIGNhbiBhbHNvIG9jY3VyIGZvciBtdW5tYXAoKSwgd2hlbiB1bm1hcHBpbmcgYSByZWdp
b24gaW4gdGhlCm1pZGRsZSBvZiBhbiBleGlzdGluZyBtYXBwaW5nLCBzaW5jZSB0aGlzIHJlc3Vs
dHMgaW4gdHdvIHNtYWxsZXIgbWFwcGluZ3MKb24gZWl0aGVyIHNpZGUgb2YgdGhlIHJlZ2lvbiBi
ZWluZyB1bm1hcHBlZC4KCkFkZCBhIG5ldyB0ZXN0IG11bm1hcDA0IHRvIGFkZHJlc3MgdGhpcyBz
Y2VuYXJpby4KClNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gQi4gTWFybGnDqHJlIDxyYm1Ac3VzZS5j
b20+Ci0tLQpDaGFuZ2VzIGluIHY0OgotIFJlYmFzZWQgYWZ0ZXIgbXVubWFwIGNvbnZlcnNpb24g
dG8gbmV3IEFQSQotIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA3
MDctbmV3LW11bm1hcDA0LXYzLTEtZTNlZmRhOGU3ZDJiQHN1c2UuY29tCgpDaGFuZ2VzIGluIHYz
OgotIEFkZGVkIG1pc3NpbmcgaW5jbHVkZSB0byAibGFwaS9tbWFwLmgiCi0gTWFkZSBtYXhfbWFw
X2NvdW50IGEgdGVzdCBvcHRpb24KLSBLZWVwIHRoZSBtYXBwZWQgcmVnaW9ucyBpbiB0aGUgaGVh
cAotIFJlcXVpcmVkIG1pbi4ga2VybmVsIHY0LjE3Ci0gTGluayB0byB2MjogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI1MDcwNC1uZXctbXVubWFwMDQtdjItMS00MzZjODBkZjk2NDZAc3Vz
ZS5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gQ29ycmVjdGVkIHRoZSBjb21taXQgbWVzc2FnZQotIExp
bmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA3MDQtbmV3LW11bm1hcDA0
LXYxLTEtNmVmOTYxMzhiMDkyQHN1c2UuY29tCi0tLQogcnVudGVzdC9zeXNjYWxscyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbXVu
bWFwLy5naXRpZ25vcmUgfCAgMSArCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL211bm1hcC9t
dW5tYXAwNC5jIHwgOTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgOTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9y
dW50ZXN0L3N5c2NhbGxzCmluZGV4IDljODBiY2NiMDkxMTRkOGI5NzMwZmRlZTA1ZTNlMjhmNWNj
NDRhZmMuLjAxMTI2ODc5ZDJkNjc5YmQ1MjllZTM2NTdmNjU4NTk4NzI4OTAwZjEgMTAwNjQ0Ci0t
LSBhL3J1bnRlc3Qvc3lzY2FsbHMKKysrIGIvcnVudGVzdC9zeXNjYWxscwpAQCAtOTUwLDYgKzk1
MCw3IEBAIG11bmxvY2thbGwwMSBtdW5sb2NrYWxsMDEKIAogbXVubWFwMDEgbXVubWFwMDEKIG11
bm1hcDAzIG11bm1hcDAzCittdW5tYXAwNCBtdW5tYXAwNAogCiBuYW5vc2xlZXAwMSBuYW5vc2xl
ZXAwMQogbmFub3NsZWVwMDIgbmFub3NsZWVwMDIKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvbXVubWFwLy5naXRpZ25vcmUgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L211bm1hcC8uZ2l0aWdub3JlCmluZGV4IGFhNmUxNGE2NzBlODVkZDE3Zjk2NWI0YTQ2NTk5N2Ew
MjFmOGI0YWMuLjdhZGU4NjM5MGEzNGNkNmZiYmY2NTMwMzg1ZTg5MWUwMWUyYjkxMzcgMTAwNjQ0
Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbXVubWFwLy5naXRpZ25vcmUKKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tdW5tYXAvLmdpdGlnbm9yZQpAQCAtMSwyICsxLDMg
QEAKIC9tdW5tYXAwMQogL211bm1hcDAzCisvbXVubWFwMDQKZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvbXVubWFwL211bm1hcDA0LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL211bm1hcC9tdW5tYXAwNC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmUzMjZkMjRhNWZiOTI3YjFiYjdj
N2Q1MTQzOGY1YTNkNzY5Njk2YzIKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL211bm1hcC9tdW5tYXAwNC5jCkBAIC0wLDAgKzEsOTQgQEAKKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisvKgorICogQ29weXJpZ2h0IChjKSAy
MDI1IFNVU0UgTExDIFJpY2FyZG8gQi4gTWFybGnDqHJlIDxyYm1Ac3VzZS5jb20+CisgKi8KKwor
LypcCisgKiBWZXJpZnkgdGhhdCBtdW5tYXAoKSBmYWlscyB3aXRoIEVOT01FTSBhZnRlciBwYXJ0
aWFsbHkgdW5tYXBwaW5nIGFuCisgKiBleGlzdGluZyBtYXAsIHdoaWxlIGhhdmluZyB0aGUgbWF4
aW11bSBhbW91bnQgb2YgbWFwcyBhbHJlYWR5IGFsbG9jYXRlZC4KKyAqLworCisjaW5jbHVkZSAi
dHN0X3Rlc3QuaCIKKyNpbmNsdWRlICJsYXBpL21tYXAuaCIKKworI2RlZmluZSBQQUQgMiAvKiBh
dm9pZCBhZGphY2VudCBtYXBwaW5nIG1lcmdlcyAqLworI2RlZmluZSBQQUdFUyAzCisjZGVmaW5l
IE1BWF9NQVBfQ09VTlRfRklMRSAiL3Byb2Mvc3lzL3ZtL21heF9tYXBfY291bnQiCisKK3N0YXRp
YyBjaGFyICpzdHJfbWF4X21hcF9jb3VudDsKK3N0YXRpYyBpbnQgbWF4X21hcF9jb3VudCA9IDUw
MDsKKworc3RhdGljIHVpbnRwdHJfdCBiYXNlID0gMHgxMDAwMDAwMDBVTDsKK3N0YXRpYyBzaXpl
X3QgcGFnZV9zejsKK3N0YXRpYyB1bnNpZ25lZCBsb25nIHZtYV9zaXplOworc3RhdGljIHVuc2ln
bmVkIGxvbmcgbWF4X21hcF9jb3VudF9vcmlnOworc3RhdGljIGludCBtYXBfY291bnQ7CitzdGF0
aWMgdm9pZCAqKm1hcHM7CisKK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQoreworCVRTVF9FWFBfRkFJ
TChtdW5tYXAobWFwc1syXSArIHBhZ2Vfc3osIHBhZ2Vfc3opLCBFTk9NRU0pOworfQorCitzdGF0
aWMgdm9pZCBzZXRfbWF4X21hcF9jb3VudChzaXplX3QgbWF4KQoreworCXRzdF9yZXMoVElORk8s
ICJTZXR0aW5nIG1heF9tYXBfY291bnQgPSAlenUiLCBtYXgpOworCVNBRkVfRklMRV9QUklOVEYo
TUFYX01BUF9DT1VOVF9GSUxFLCAiJXp1IiwgbWF4KTsKK30KKworc3RhdGljIHZvaWQgc2V0dXAo
dm9pZCkKK3sKKwlwYWdlX3N6ID0gU0FGRV9TWVNDT05GKF9TQ19QQUdFU0laRSk7CisJdm1hX3Np
emUgPSBQQUdFUyAqIHBhZ2Vfc3o7CisKKwlpZiAodHN0X3BhcnNlX2ludChzdHJfbWF4X21hcF9j
b3VudCwgJm1heF9tYXBfY291bnQsIDEwMCwgSU5UX01BWCkpCisJCXRzdF9icmsoVEJST0ssICJJ
bnZhbGlkIG1heC4gbWFwIGNvdW50ICclcyciLAorCQkJc3RyX21heF9tYXBfY291bnQpOworCisJ
U0FGRV9GSUxFX1NDQU5GKE1BWF9NQVBfQ09VTlRfRklMRSwgIiVsdSIsICZtYXhfbWFwX2NvdW50
X29yaWcpOworCXRzdF9yZXMoVElORk8sICJPcmlnaW5hbCBtYXhfbWFwX2NvdW50ID0gJWx1Iiwg
bWF4X21hcF9jb3VudF9vcmlnKTsKKwlzZXRfbWF4X21hcF9jb3VudChtYXhfbWFwX2NvdW50KTsK
KworCW1hcHMgPSBTQUZFX01BTExPQyhtYXhfbWFwX2NvdW50ICogc2l6ZW9mKGNoYXIgKikpOwor
CWZvciAoaW50IGkgPSAwOyBpIDwgbWF4X21hcF9jb3VudDsgaSsrKQorCQltYXBzW2ldID0gTlVM
TDsKKworCXdoaWxlICgxKSB7CisJCXZvaWQgKnAgPQorCQkJbW1hcCgodm9pZCAqKShiYXNlICsg
UEFEICogdm1hX3NpemUgKiBtYXBfY291bnQpLAorCQkJICAgICB2bWFfc2l6ZSwgUFJPVF9OT05F
LAorCQkJICAgICBNQVBfUFJJVkFURSB8IE1BUF9BTk9OWU1PVVMgfCBNQVBfRklYRURfTk9SRVBM
QUNFLAorCQkJICAgICAtMSwgMCk7CisJCWlmIChwID09IE1BUF9GQUlMRUQpCisJCQlicmVhazsK
KwkJbWFwc1ttYXBfY291bnQrK10gPSBwOworCX0KKworCWlmIChtYXBfY291bnQgPT0gbWF4X21h
cF9jb3VudCkKKwkJdHN0X2JyayhUQlJPSywgIk1hcHBlZCBhbGwgJWQgcmVnaW9ucywgZXhwZWN0
ZWQgbGVzcyIsCisJCQltYXBfY291bnQpOworCisJdHN0X3JlcyhUSU5GTywgIk1hcHBlZCAlZCBy
ZWdpb25zIiwgbWFwX2NvdW50KTsKK30KKworc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQorewor
CXNldF9tYXhfbWFwX2NvdW50KG1heF9tYXBfY291bnRfb3JpZyk7CisJZm9yIChpbnQgaSA9IDA7
IGkgPCBtYXBfY291bnQ7IGkrKykgeworCQlpZiAobWFwc1tpXSA9PSBOVUxMKQorCQkJYnJlYWs7
CisJCVNBRkVfTVVOTUFQKCh2b2lkICopKG1hcHNbaV0pLCB2bWFfc2l6ZSk7CisJfQorCWZyZWUo
bWFwcyk7Cit9CisKK3N0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKKwkudGVzdF9hbGwg
PSBydW4sCisJLnNldHVwID0gc2V0dXAsCisJLmNsZWFudXAgPSBjbGVhbnVwLAorCS5uZWVkc19y
b290ID0gMSwKKwkubWluX2t2ZXIgPSAiNC4xNyIsCisJLm9wdGlvbnMgPSAoc3RydWN0IHRzdF9v
cHRpb25bXSl7IHsgIm46IiwgJnN0cl9tYXhfbWFwX2NvdW50LAorCQkJCQkgICAgIk1heC4gbWFw
IGNvdW50IChkZWZhdWx0OiA1MDApIiB9LAorCQkJCQkgIHt9IH0sCit9OwoKLS0tCmJhc2UtY29t
bWl0OiAwYzczNDZjYjA5NzQ0MDkwMjU2ODg1NjUyN2JlNzE2MmY1OTUwNDk3CmNoYW5nZS1pZDog
MjAyNTA3MDQtbmV3LW11bm1hcDA0LWE1OWNhMjBhZTAwYwoKQmVzdCByZWdhcmRzLAotLSAKUmlj
YXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
