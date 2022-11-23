Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E731C636240
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Nov 2022 15:48:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B59DE3CC9F1
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Nov 2022 15:48:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4FCC3CC9EA
 for <ltp@lists.linux.it>; Wed, 23 Nov 2022 15:48:03 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 058C41A00664
 for <ltp@lists.linux.it>; Wed, 23 Nov 2022 15:48:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3E4A1FB;
 Wed, 23 Nov 2022 06:48:05 -0800 (PST)
Received: from e129169.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50EF83F73B;
 Wed, 23 Nov 2022 06:47:58 -0800 (PST)
From: Tudor Cretu <tudor.cretu@arm.com>
To: ltp@lists.linux.it
Date: Wed, 23 Nov 2022 14:47:43 +0000
Message-Id: <20221123144746.590890-1-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] safe_macros: Fix undefined behaviour in vararg
 handling
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QWNjZXNzaW5nIGVsZW1lbnRzIGluIGFuIGVtcHR5IHZhX2xpc3QgcmVzdWx0cyBpbiB1bmRlZmlu
ZWQgYmVoYXZpb3VyWzBdCnRoYXQgY2FuIGluY2x1ZGUgYWNjZXNzaW5nIGFyYml0cmFyeSBzdGFj
ayBtZW1vcnkuIFdoaWxlIHR5cGljYWxseSB0aGlzCmRvZXNuJ3QgcmFpc2UgYSBmYXVsdCwgc29t
ZSBuZXcgbW9yZSBzZWN1cml0eS1vcmllbnRlZCBhcmNoaXRlY3R1cmVzCihlLmcuIENIRVJJWzFd
IG9yIE1vcmVsbG9bMl0pIGRvbid0IGFsbG93IGl0LgoKVGhlcmVmb3JlLCByZW1vdmUgdGhlIHZh
cmlhZGljbmVzcyBmcm9tIHNhZmVfKiB3cmFwcGVycyB0aGF0IGFsd2F5cyBjYWxsCnRoZSBmdW5j
dGlvbnMgd2l0aCB0aGUgb3B0aW9uYWwgYXJndW1lbnQgaW5jbHVkZWQuCgpBZGFwdCB0aGUgcmVz
cGVjdGl2ZSBTQUZFXyogbWFjcm9zIHRvIGhhbmRsZSB0aGUgY2hhbmdlIGJ5IHBhc3NpbmcgYQpk
ZWZhdWx0IGFyZ3VtZW50IGlmIHRoZXkncmUgb21pdHRlZC4KClswXTogW0lTTy9JRUMgOTg5OToy
MDExXSBQcm9ncmFtbWluZyBMYW5ndWFnZXPigJRDLCAzcmQgZWQsIHBhcmFncmFwaCA3LjE2LjEu
MQpbMV06IGh0dHBzOi8vd3d3LmNsLmNhbS5hYy51ay9yZXNlYXJjaC9zZWN1cml0eS9jdHNyZC9j
aGVyaS8KWzJdOiBodHRwczovL3d3dy5tb3JlbGxvLXByb2plY3Qub3JnLwoKVHVkb3IgQ3JldHUg
KDMpOgogIHNhZmVfb3BlbjogRml4IHVuZGVmaW5lZCBiZWhhdmlvdXIgaW4gdmFyYXJnIGhhbmRs
aW5nCiAgc2FmZV9vcGVuYXQ6IEZpeCB1bmRlZmluZWQgYmVoYXZpb3VyIGluIHZhcmFyZyBoYW5k
bGluZwogIHNhZmVfc2VtY3RsOiBGaXggdW5kZWZpbmVkIGJlaGF2aW91ciBpbiB2YXJhcmcgaGFu
ZGxpbmcKCiBpbmNsdWRlL29sZC9zYWZlX21hY3Jvcy5oICAgfCAgNiArKysrLS0KIGluY2x1ZGUv
c2FmZV9tYWNyb3NfZm4uaCAgICB8ICAzICsrLQogaW5jbHVkZS90c3Rfc2FmZV9maWxlX2F0Lmgg
IHwgMTAgKysrKysrLS0tLQogaW5jbHVkZS90c3Rfc2FmZV9tYWNyb3MuaCAgIHwgIDYgKysrKy0t
CiBpbmNsdWRlL3RzdF9zYWZlX3N5c3ZfaXBjLmggfCAxNCArKysrKysrKystLS0tLQogbGliL3Nh
ZmVfbWFjcm9zLmMgICAgICAgICAgIHwgMTMgKy0tLS0tLS0tLS0tLQogbGliL3RzdF9jZ3JvdXAu
YyAgICAgICAgICAgIHwgIDIgKy0KIGxpYi90c3Rfc2FmZV9maWxlX2F0LmMgICAgICB8IDExICsr
Ky0tLS0tLS0tCiBsaWIvdHN0X3NhZmVfc3lzdl9pcGMuYyAgICAgfCAxMCArLS0tLS0tLS0tCiA5
IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQoKLS0gCjIu
MjUuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
