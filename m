Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 828DC2BE63
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 06:40:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54E9A3EA5F1
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 06:40:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 209E93EA51C
 for <ltp@lists.linux.it>; Tue, 28 May 2019 06:40:08 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DB87D10013A7
 for <ltp@lists.linux.it>; Tue, 28 May 2019 06:40:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A30143079B8A;
 Tue, 28 May 2019 04:40:06 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 153A126E76;
 Tue, 28 May 2019 04:40:05 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: chrubis@suse.cz
Date: Tue, 28 May 2019 12:39:29 +0800
Message-Id: <20190528043929.19671-4-xzhou@redhat.com>
In-Reply-To: <20190528043929.19671-1-xzhou@redhat.com>
References: <20190523135518.GF30616@rei.lan>
 <20190528043929.19671-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 28 May 2019 04:40:06 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v5 4/4] syscalls/swapoff/swapoff01: use helper to
	check support status
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

T2Ygc3dhcCBvcGVyYXRpb25zLiBDaGFuZ2UgTWFrZWZpbGUgdG8gdXNlIGZ1bmN0aW9ucyBmcm9t
Ci4uL3N3YXBvbi9saWJzd2Fwb24uYwoKU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91
QHJlZGhhdC5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2Vm
aWxlICAgICB8ICAzICsrLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2Vm
aWxlLmluYyB8ICA2ICsrKysrKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3
YXBvZmYwMS5jICB8IDEwICsrLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUuaW5jCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9zd2Fwb2ZmL01ha2VmaWxlCmluZGV4IGJkNjE3ZDgwNi4uNTM2YjJkYmFjIDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUKKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlCkBAIC0xOSw1ICsxOSw2IEBACiB0
b3Bfc3JjZGlyCQk/PSAuLi8uLi8uLi8uLgogCiBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVk
ZS9tay90ZXN0Y2FzZXMubWsKLQoraW5jbHVkZSAkKGFic19zcmNkaXIpLy4vTWFrZWZpbGUuaW5j
CiBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1r
CiskKE1BS0VfVEFSR0VUUyk6ICU6ICUubyAuLi9zd2Fwb24vbGlic3dhcG9uLm8KZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9NYWtlZmlsZS5pbmMgYi90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUuaW5jCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uNjUzNTBjYmViCi0tLSAvZGV2L251bGwKKysrIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlLmluYwpAQCAtMCwwICsxLDYg
QEAKK0xJQkRJUgkJCSs9IC4uL3N3YXBvbi8KK0xJQlNXQVBPTgkJOj0gJChMSUJESVIpL2xpYnN3
YXBvbi5vCiskKExJQlNXQVBPTik6CisJJChNQUtFKSAtQyAkKExJQkRJUikKK0NQUEZMQUdTCQkr
PSAtSSQoYWJzX3NyY2RpcikvJChMSUJESVIpCitMREZMQUdTCQkJKz0gLUwkKGFic19idWlsZGRp
cikvJChMSUJESVIpCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBv
ZmYvc3dhcG9mZjAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9m
ZjAxLmMKaW5kZXggYTYzZTY2MWE1Li43OWU0OGM2YWMgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9zd2Fwb2ZmMDEuYworKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAxLmMKQEAgLTI1LDYgKzI1LDcgQEAKICNpbmNsdWRl
IDxzdGRsaWIuaD4KICNpbmNsdWRlICJjb25maWcuaCIKICNpbmNsdWRlICJsYXBpL3N5c2NhbGxz
LmgiCisjaW5jbHVkZSAiLi4vc3dhcG9uL2xpYnN3YXBvbi5oIgogCiBzdGF0aWMgdm9pZCBzZXR1
cCh2b2lkKTsKIHN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCk7CkBAIC04NiwxNCArODcsNyBAQCBz
dGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogCiAJdHN0X3RtcGRpcigpOwogCi0Jc3dpdGNoICgoZnNf
dHlwZSA9IHRzdF9mc190eXBlKGNsZWFudXAsICIuIikpKSB7Ci0JY2FzZSBUU1RfTkZTX01BR0lD
OgotCWNhc2UgVFNUX1RNUEZTX01BR0lDOgotCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJ
CSAiQ2Fubm90IGRvIHN3YXBvZmYgb24gYSBmaWxlIG9uICVzIGZpbGVzeXN0ZW0iLAotCQkJIHRz
dF9mc190eXBlX25hbWUoZnNfdHlwZSkpOwotCWJyZWFrOwotCX0KKwlpc19zd2FwX3N1cHBvcnRl
ZChjbGVhbnVwLCAic3dhcG9mZiIsICIuL3RzdHN3YXAiKTsKIAogCWlmICghdHN0X2ZzX2hhc19m
cmVlKE5VTEwsICIuIiwgNjQsIFRTVF9NQikpIHsKIAkJdHN0X2Jya20oVEJST0ssIGNsZWFudXAs
Ci0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
