Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F439C6D
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Jun 2019 12:27:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E015F3EB180
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Jun 2019 12:27:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CCE043EA5FD
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 12:27:35 +0200 (CEST)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 93AA11000CC9
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 12:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=dmPSQtXXY/rvKjFS9O
 kNrbUrLUUh7vfuQ9tx1Gb/gWk=; b=JidIhqL/GyfshbzHDLyawey0ct11GzPJEz
 Nj2JqZzuWNh73N4hKhf1L9oBZYgVwjMeZztu/ZkmVIZLQOTML7vH9Y4WiZTDBc4e
 Rj3Tl0mqMkSJ4V9QHrwzsx/euCXRbSOnphQA4iqkY+3Jw8E/ug5OIyk3VsKVTBV4
 YGBbHMq7s=
Received: from RHEL7U5GA_Intel64.localdomain (unknown [114.224.173.228])
 by smtp13 (Coremail) with SMTP id EcCowACHjj6TjftcUD8oAg--.613S2;
 Sat, 08 Jun 2019 18:27:32 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Sat,  8 Jun 2019 18:27:13 +0800
Message-Id: <1559989633-24711-1-git-send-email-ice_yangxiao@163.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: EcCowACHjj6TjftcUD8oAg--.613S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWUKFyDJrWxAw4UCw1rJFb_yoW3Gwb_t3
 W7Kw1xGayjyrWUKrWfAw1vqFWrKa4UGrs5Kr9rKas3XrWUX34DGas0vr13Jr98uF4kur9x
 Crs3WFsYqw15ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_4rW7UUUUU==
X-Originating-IP: [114.224.173.228]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiTALNXlSIftYs1QABsR
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/acct02.c: Fix EMFILE error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

UnVubmluZyBhY2N0MDIgd2l0aCAiLWkgbGFyZ2UgbnVtYmVyIiBvcHRpb24gbWF5IGdldCBFTUZJ
TEUgZXJyb3IsCmJlY2F1c2UgJ2ZkJyBmaWxlIGRlc2NyaXB0b3IgaXMgbm90IGNsb3NlZCBvbiBl
YWNoIGl0ZXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IFhpYW8gWWFuZyA8aWNlX3lhbmd4aWFvQDE2
My5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9hY2N0L2FjY3QwMi5jIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvYWNjdC9hY2N0MDIuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvYWNjdC9hY2N0MDIuYwppbmRleCA4YTk5YmI5Li5mNjFmYWYyIDEwMDY0NAotLS0gYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2FjY3QvYWNjdDAyLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9hY2N0L2FjY3QwMi5jCkBAIC0xNDAsNiArMTQwLDggQEAgc3RhdGljIHZvaWQg
cnVuKHZvaWQpCiAJCXRzdF9yZXMoVFBBU1MsICJhY2N0KCkgd3JvdGUgY29ycmVjdCBmaWxlIGNv
bnRlbnRzISIpOwogCWVsc2UKIAkJdHN0X3JlcyhURkFJTCwgImFjY3QoKSB3cm90ZSBpbmNvcnJl
Y3QgZmlsZSBjb250ZW50cyEiKTsKKworCVNBRkVfQ0xPU0UoZmQpOwogfQogCiBzdGF0aWMgdm9p
ZCBzZXR1cCh2b2lkKQotLSAKMS44LjMuMQoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
