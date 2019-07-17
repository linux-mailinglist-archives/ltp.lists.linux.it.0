Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3046B84B
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 10:35:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1C8A3C1D1E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 10:35:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0783A3C1CA0
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 10:35:01 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ECF94600768
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 10:35:00 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6H8Ysot000091
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 17 Jul 2019 01:34:54 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Wed, 17 Jul 2019 01:34:53 -0700
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
To: <linux-btrfs@vger.kernel.org>, <josef@toxicpanda.com>
Message-ID: <b501bcff-8be0-4303-8789-363fda4658e5@windriver.com>
Date: Wed, 17 Jul 2019 16:34:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] Bug Report: Btrfs can't allocate space for delete when block
 size arounds 512M
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
Cc: dsterba@suse.com, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgZnJpZW5kcywKCipEZXNjcmlwdGlvbjoqCgoKIMKgwqDCoCBPbmUgTFRQIHRlc3RjYXNlLCBm
c19maWxsLmMsIGZhaWxzIG9uIGJ0cmZzIHdpdGgga2VybmVsIGVycm9yIHdoZW4gCnVubGluayBm
aWxlcyBvbiBCdHJmcyBkZXZpY2U6CgogwqDCoMKgICJCVFJGUyB3YXJuaW5nIChkZXZpY2UgbG9v
cDApOiBjb3VsZCBub3QgYWxsb2NhdGUgc3BhY2UgZm9yIGEgCmRlbGV0ZTsgd2lsbCB0cnVuY2F0
ZSBvbiBtb3VudCIuCgoKIMKgwqDCoCBJIGZvdW5kIHRoZSBsb29wIGJsb2NrIGRldmljZSBmb3Jt
YXR0ZWQgd2l0aCBidHJmcyByb3VnaGx5IHJhbmdzIApmcm9tIDQ2ME0gdG8gNTYwTSB3aWxsIGNh
dXNlIHRoZSBlcnJvci4KCiDCoMKgwqAgMjU2TSBhbmQgMUcgYWxsIHBhc3MuCgoKIMKgwqDCoCBU
aGUgZnNfZmlsbC5jIHNvdXJjZSBjb2RlOgoKW2h0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0
LXByb2plY3QvbHRwL2Jsb2IvbWFzdGVyL3Rlc3RjYXNlcy9rZXJuZWwvZnMvZnNfZmlsbC9mc19m
aWxsLmNdCgogwqDCoMKgIFRoZSBmc19maWxsLmMgY2FsbHMgdW5saW5rIHdoaWNoIHRyaWdnZXJz
IHRoZSBlcnJvci4KCltodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9i
bG9iL2UzNDU3ZTQyYzFiOTNmNTRiYjgxZGE3NDZlYmEzMTRmZDM0YWQ0MGUvdGVzdGNhc2VzL2tl
cm5lbC9mcy9mc19maWxsL2ZzX2ZpbGwuYyNMNTVdCgpbaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4
LXRlc3QtcHJvamVjdC9sdHAvYmxvYi9lMzQ1N2U0MmMxYjkzZjU0YmI4MWRhNzQ2ZWJhMzE0ZmQz
NGFkNDBlL2xpYi9zYWZlX21hY3Jvcy5jI0wzNThdCgoKKkVycm9yIGluZm86KgoKIMKgwqDCoCBU
aGUgaXNzdWUgbWF5YmUgbm90IHJlcHJvZHVjZWQgZXZlcnl0aW1lIGJ1dCBmb3VyIGZpZnRocyBj
aGFuY2UuCgogwqDCoMKgIGZzX2ZpbGwuYzo1MzogSU5GTzogVW5saW5raW5nIG1udHBvaW50L3Ro
cmVhZDUvZmlsZTAKIMKgwqDCoCBzYWZlX21hY3Jvcy5jOjM2MDogQlJPSzogZnNfZmlsbC5jOjU1
OiAKdW5saW5rKG1udHBvaW50L3RocmVhZDEwL2ZpbGUwKSBmYWlsZWQ6IEVOT1NQQwogwqDCoMKg
IHNhZmVfbWFjcm9zLmM6MzYwOiBCUk9LOiBmc19maWxsLmM6NTU6IAp1bmxpbmsobW50cG9pbnQv
dGhyZWFkMTEvZmlsZTApIGZhaWxlZDogRU5PU1BDCiDCoMKgwqAgWzYyNDc3LjM3ODg0OF0gQlRS
RlMgd2FybmluZyAoZGV2aWNlIGxvb3AwKTogY291bGQgbm90IGFsbG9jYXRlIApzcGFjZSBmb3Ig
YSBkZWxldGU7IHdpbGwgdHJ1bmNhdGUgb24gbW91bnQKIMKgwqDCoCBbNjI0NzcuMzc4OTA1XSBC
VFJGUyB3YXJuaW5nIChkZXZpY2UgbG9vcDApOiBjb3VsZCBub3QgYWxsb2NhdGUgCnNwYWNlIGZv
ciBhIGRlbGV0ZTsgd2lsbCB0cnVuY2F0ZSBvbiBtb3VudAoKCgoqS2VybmVsOioKCiDCoMKgwqAg
QWZ0ZXIgdjUuMi1yYzEsIHFlbXV4ODYtNjQKCiDCoMKgwqAgIyBtYWtlIC1qNDAgQVJDSD14ODZf
NjQgQ1JPU1NfQ09NUElMRT14ODYtNjQtZ2NjCiDCoMKgwqAgdXNlIHFlbXUgdG8gYm9vdHVwIGtl
cm5lbAoKCipMVFA6KgoKIMKgwqDCoCBtYXN0ZXIgYnJhbmNoOiBJIHRlc3RlZCBvbiAyMDE5MDYy
NQogwqDCoMKgIFJlcHJvZHVjZToKCiDCoMKgwqAgLy8gYnVpbGQgTHRwCiDCoMKgwqAgIyBjZCBM
dHAtc291cmNlCiDCoMKgwqAgIyAuL2J1aWxkLnNoCgogwqDCoMKgIC8vIGNvcHkgZmlsZXMgdG8g
cWVtdQogwqDCoMKgICMgY3AgcnVubHRwIHRlc3RjYXNlcy9rZXJuZWwvZnMvZnNfZmlsbC9mc19m
aWxsIHRvIHFlbXUKCiDCoMKgwqAgLy8gbG9naW4gdG8gcWVtdToKIMKgwqDCoCAvLyBhZGp1c3Qg
YmxvY2sgZGV2aWNlIHNpemUgdG8gNTEyTQogwqDCoMKgICMgdmkgcnVubHRwCiDCoMKgwqAgaW4g
ZnVuY3Rpb246IGNyZWF0ZV9ibG9jaygpCiDCoMKgwqAgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBv
Zj0ke1RNUH0vdGVzdC5pbWcgYnM9MTAyNCBjb3VudD0yNjIxNDQKIMKgwqDCoCDCoMKgwqAgLS0t
PgogwqDCoMKgIMKgwqDCoCBkZCBpZj0vZGV2L3plcm8gb2Y9JHtUTVB9L3Rlc3QuaW1nIGJzPTEw
MjQgY291bnQ9NTI0Mjg4CgogwqDCoMKgIC8vIGV4ZWN1dGUgdGVzdGNhc2UKIMKgwqDCoCAjIHJ1
bmx0cCAtZiBmcyAtcyBmc19maWxsCgoKKkFuYWx5c2lzOioKCiDCoMKgwqAgT25lIG5ldyBrZXJu
ZWwgY29tbWl0IGNvbnRhaW5lZCBpbiB2NS4yLXJjMSBpbnRyb2R1Y2VzIHRoZSBpc3N1ZS4KCiDC
oMKgwqAgY29tbWl0IGM4ZWFlYWM3YjczNDM0N2MzYWZiYTcwMDhiN2FmNjJmMzdiOWMxNDAKIMKg
wqDCoCBBdXRob3I6IEpvc2VmIEJhY2lrIDxqb3NlZkB0b3hpY3BhbmRhLmNvbT4KIMKgwqDCoCBE
YXRlOsKgwqAgV2VkIEFwciAxMCAxNTo1NjoxMCAyMDE5IC0wNDAwCgogwqDCoMKgIMKgwqDCoCBi
dHJmczogcmVzZXJ2ZSBkZWxhbGxvYyBtZXRhZGF0YSBkaWZmZXJlbnRseQogwqDCoCDCoMKgIMKg
IC4uLgoKCkFueW9uZSdzIHJlcGx5IHdpbGwgYmUgYXBwcmVjaWF0ZWQuCgotLUhvbmd6aGkKCgoK
CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
