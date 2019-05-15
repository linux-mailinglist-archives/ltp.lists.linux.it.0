Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D18941EA6F
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 10:48:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CEB9294AEE
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 10:48:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 91A11294A9F
 for <ltp@lists.linux.it>; Wed, 15 May 2019 10:48:34 +0200 (CEST)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 09D79201549
 for <ltp@lists.linux.it>; Wed, 15 May 2019 10:48:32 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id y13so1336717lfh.9
 for <ltp@lists.linux.it>; Wed, 15 May 2019 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PqVaSFiBytC8hxBsEh/HgINdW7HiuF2nkdZ+Xr3sRJM=;
 b=c4eMVd1cLxlB6SJBmNhemOrHGlx22bRWlhjGFOgNaLhbLW2OsPnJ6q7IN/0qHO2SJT
 44NH8SW7Cz7C3NbkZ6LUVyuc+HzNnulv1amtnBP+4BzX65YCeVqIiFPthbsIvGNRastI
 FbjiJSRIsNnOy55OzOM24lwDTwQ8e3guvD/twvzX8/U23YRpw/0O0FdUM5g8ol8rvtGT
 3HQfxeXNsLpmFjaOI0s2beybpvYsZWr56AL1iTqZnKWFCOtzAIRlXYsgw/i9aL/6NEPD
 g7GWfCO0vCdWKEMkUAxLxifdzh0t3jxTgaNvygX4vDQBbW/QJM0RreiOZzIYruK6B9fL
 hGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PqVaSFiBytC8hxBsEh/HgINdW7HiuF2nkdZ+Xr3sRJM=;
 b=gcayWDSgmmfkN6vAICuRMHDA9vXuv9ZWeX/H1SqzEkkHIPME6K/CVC2OP7+u6hYt3O
 4/nxnn5QQ4CVsiEUSRpWxGOzVX0k6Jyi/UqdKcYaUEqP5iJUUOKz5OeyNvUyDsBaRjQ5
 AmKR9cUW5GvumAiXNwYVZ/ncQ/qssecTPT+/pzLzGoKFZMNKFRaeJgBbBJdZh5F+78eA
 Ihh7C57k96YkmWNhYMSGlKvB3LT7xOqB8nu0dOMv8k9QCLyqyNNj+DtM9zu1IP81X7KX
 nB6GDYssh6CuT4I8FRBSMXvlGxgUlgTo/3QTSnKysglV8xv1PUCQfFlJ/6YkiI+2Xuf5
 Jd9Q==
X-Gm-Message-State: APjAAAVx0P9ueiK63KemZOyAcXN/dJGb5NXM8y08H0C7hjCoXlmSg+jQ
 bAxGHYg5ErrYLfTFyWCpWebutYX+wdruIsEEOq/qCeQXu4o=
X-Google-Smtp-Source: APXvYqz27fihyYyeqJzcm9uZcyrM35iaJPBOLqtP38PCvZvb3HdahvBJTwe31L0dHMb3DcwxQ1okZ20YuVymiVG6A6k=
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr16922584lfa.137.1557909654616; 
 Wed, 15 May 2019 01:40:54 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 15 May 2019 14:10:43 +0530
Message-ID: <CA+G9fYu254sYc77jOVifOmxrd_jNmr4wNHTrqnW54a8F=EQZ6Q@mail.gmail.com>
To: ltp@lists.linux.it, linux-mm@kvack.org
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: dengke.du@windriver.com, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org
Subject: [LTP] LTP: mm: overcommit_memory01, 03...06 failed
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

bHRwLW1tLXRlc3RzIGZhaWxlZCBvbiBMaW51eCBtYWlubGluZSBrZXJuZWwgIDUuMS4wLAogICog
b3ZlcmNvbW1pdF9tZW1vcnkwMSBvdmVyY29tbWl0X21lbW9yeQogICogb3ZlcmNvbW1pdF9tZW1v
cnkwMyBvdmVyY29tbWl0X21lbW9yeSAtUiAzMAogICogb3ZlcmNvbW1pdF9tZW1vcnkwNCBvdmVy
Y29tbWl0X21lbW9yeSAtUiA4MAogICogb3ZlcmNvbW1pdF9tZW1vcnkwNSBvdmVyY29tbWl0X21l
bW9yeSAtUiAxMDAKICAqIG92ZXJjb21taXRfbWVtb3J5MDYgb3ZlcmNvbW1pdF9tZW1vcnkgLVIg
MjAwCgptZW0uYzo4MTQ6IElORk86IHNldCBvdmVyY29tbWl0X21lbW9yeSB0byAwCm92ZXJjb21t
aXRfbWVtb3J5LmM6MTg1OiBJTkZPOiBtYWxsb2MgODA5NDg0NCBrQiBzdWNjZXNzZnVsbHkKb3Zl
cmNvbW1pdF9tZW1vcnkuYzoyMDQ6IFBBU1M6IGFsbG9jIHBhc3NlZCBhcyBleHBlY3RlZApvdmVy
Y29tbWl0X21lbW9yeS5jOjE4OTogSU5GTzogbWFsbG9jIDMyMzc5Mzc2IGtCIGZhaWxlZApvdmVy
Y29tbWl0X21lbW9yeS5jOjIxMDogUEFTUzogYWxsb2MgZmFpbGVkIGFzIGV4cGVjdGVkCm92ZXJj
b21taXRfbWVtb3J5LmM6MTg1OiBJTkZPOiBtYWxsb2MgMTYzNjAyMTYga0Igc3VjY2Vzc2Z1bGx5
Cm92ZXJjb21taXRfbWVtb3J5LmM6MjEyOiBGQUlMOiBhbGxvYyBwYXNzZWQsIGV4cGVjdGVkIHRv
IGZhaWwKCkZhaWxlZCB0ZXN0IGxvZywKaHR0cHM6Ly9sa2Z0LnZhbGlkYXRpb24ubGluYXJvLm9y
Zy9zY2hlZHVsZXIvam9iLzcyNjQxNyNMMjI4NTIKCkxUUCB2ZXJzaW9uIDIwMTkwMTE1CgpUZXN0
IGNhc2UgbGluaywKaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvYmxv
Yi9tYXN0ZXIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vdHVuYWJsZS9vdmVyY29tbWl0X21lbW9yeS5j
I0wyMTIKCkZpcnN0IGJhZCBjb21taXQ6CmdpdCBicmFuY2ggbWFzdGVyCmdpdCBjb21taXQgZTA2
NTQyNjRjNDgwNmRjNDM2YjI5MTI5NGEwZmJmOWJlNzU3MWFiNgpnaXQgZGVzY3JpYmUgdjUuMS0x
MDcwNi1nZTA2NTQyNjRjNDgwCmdpdCByZXBvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdAoKTGFzdCBnb29kIGNvbW1pdDoK
Z2l0IGJyYW5jaCBtYXN0ZXIKZ2l0IGNvbW1pdCA3ZTk4OTBhMzUwMGQ5NWMwMTUxMWE0YzQ1Yjdl
NzE5MmRmYTQ3YWUyCmdpdCBkZXNjcmliZSB2NS4xLTEwMzI2LWc3ZTk4OTBhMzUwMGQKZ2l0IHJl
cG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0CgpCZXN0IHJlZ2FyZHMKTmFyZXNoIEthbWJvanUKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
