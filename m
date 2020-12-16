Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F01D42DBE24
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:02:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDE653C5817
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:02:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E913F3C2AE9
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:02:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 19D496010EA
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:02:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1608112923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKdu5Qg1pj/eqxrsp0jt+JsuClv+FxwJlEr1G54IY2M=;
 b=goKQFjHj+5juUP2uvVFWEDs+1x7GPq8xKXpg+fuC1T+i6brXA5iquNYvd3xpPWqLCm9T/c
 JT4vEh6lf0l/9kfXDmMKY5g5StAwEROKwf+bSs0LUOqsbVANvWC98u/bGy5fW9BMMqUNTQ
 rs7vXllsri0MDDTKm5HZIBtXCVKLnHo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC23EAEA6;
 Wed, 16 Dec 2020 10:02:03 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 10:01:20 +0000
Message-Id: <20201216100121.16683-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216100121.16683-1-rpalethorpe@suse.com>
References: <20201216100121.16683-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 4/5] CGroup test guidelines
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LS0tCiBkb2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0IHwgMTggKysrKysrKysrKy0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kb2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0IGIvZG9jL3Rlc3Qtd3Jp
dGluZy1ndWlkZWxpbmVzLnR4dAppbmRleCA5OWZiMzQ2MjguLmQxY2RiNzBlMCAxMDA2NDQKLS0t
IGEvZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dAorKysgYi9kb2MvdGVzdC13cml0aW5n
LWd1aWRlbGluZXMudHh0CkBAIC0yMTQ4LDE2ICsyMTQ4LDE4IEBAIHRoZSBmaWVsZCB2YWx1ZSBv
ZiBmaWxlLgogCiAyLjIuMzYgVXNpbmcgQ29udHJvbCBHcm91cAogXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl4KLVNvbWUgb2YgTFRQIHRlc3RzIG5lZWQgQ29udHJvbCBHcm91cCBpbiB0aGVpciBj
b25maWd1cmF0aW9uLCB0c3RfY2dyb3VwLmggcHJvdmlkZXMKLUFQSXMgdG8gbWFrZSBjZ3JvdXAg
dW5pZmllZCBtb3VudGluZyBhdCBzZXR1cCBwaGFzZSB0byBiZSBwb3NzaWJsZS4gVGhlIG1ldGhv
ZMKgaXMKKworU29tZSBvZiBMVFAgdGVzdHMgbmVlZCBDb250cm9sIEdyb3VwcyBpbiB0aGVpciBj
b25maWd1cmF0aW9ucywgdHN0X2Nncm91cC5oIHByb3ZpZGVzCitBUElzIHRvIGRpc2NvdmVyIGFu
ZCB1c2UgQ0dyb3Vwcy4gVGhlIG1ldGhvZMKgaXMKIGV4dHJhY3RlZCBmcm9tIG1lbS5oIHdpdGgg
dGhlIHB1cnBvc2Ugb2bCoGV4dGVuZGlibGUgZm9yIGZ1cnRoZXIgZGV2ZWxvcGluZywgYW5kCiB0
cnlpbmcgdG8gY29tcGF0aWJsZSB0aGUgY3VycmVudCB0d28gdmVyc2lvbnMgb2YgY2dyb3VwLgog
Ci1Db25zaWRlcmluZyB0aGVyZSBhcmUgbWFueSBkaWZmZXJlbmNlcyBiZXR3ZWVuIGNncm91cCB2
MSBhbmQgdjIsIGhlcmUgd2UgY2Fwc3VsYXRlCitDb25zaWRlcmluZyB0aGVyZSBhcmUgbWFueSBk
aWZmZXJlbmNlcyBiZXR3ZWVuIGNncm91cCB2MSBhbmQgdjIsIGhlcmUgd2UgZW5jYXBzdWxhdGUK
IHRoZSBkZXRhaWwgb2YgY2dyb3VwIG1vdW50aW5nIGluIGhpZ2gtbGV2ZWwgZnVuY3Rpb25zLCB3
aGljaCB3aWxsIGJlIGVhc2llciB0byB1c2UKLWNncm91cCB3aXRob3V0IGNhcmluZyBhYm91dCB0
b28gbXVjaCB0ZWNobmljYWwgdGhpbmcuwqAgwqAKK2Nncm91cCB3aXRob3V0IGNhcmluZyBhYm91
dCB0b28gbXVjaCB0ZWNobmljYWwgdGhpbmcuCiAKIEFsc28sIHdlIGRvIGNncm91cCBtb3VudC91
bW91bnQgd29yayBmb3IgdGhlIGRpZmZlcmVudCBoaWVyYXJjaHkgYXV0b21hdGljYWxseS4KK0lm
IHRoYXQgaXMgcmVxdWlyZWQuCiAKIFtzb3VyY2UsY10KIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
QEAgLTIxNjcsOCArMjE2OSw4IEBAIHN0YXRpYyB2b2lkIHJ1bih2b2lkKQogewogCS4uLgogCi0J
dHN0X2Nncm91cF9tb3ZlX2N1cnJlbnQoUEFUSF9UTVBfQ0dfTUVNKTsKLQl0c3RfY2dyb3VwX21l
bV9zZXRfbWF4Ynl0ZXMoUEFUSF9UTVBfQ0dfTUVNLCBNRU1TSVpFKTsKKwl0c3RfY2dyb3VwX21v
dmVfY3VycmVudChUU1RfQ0dST1VQX01FTU9SWSk7CisJdHN0X2Nncm91cF9tZW1fc2V0X21heGJ5
dGVzKE1FTVNJWkUpOwogCiAJLy8gZG8gdGVzdCB1bmRlciBjZ3JvdXAKIAkuLi4KQEAgLTIxNzYs
MTIgKzIxNzgsMTIgQEAgc3RhdGljIHZvaWQgcnVuKHZvaWQpCiAKIHN0YXRpYyB2b2lkIHNldHVw
KHZvaWQpCiB7Ci0JdHN0X2Nncm91cF9tb3VudChUU1RfQ0dST1VQX01FTUNHLCBQQVRIX1RNUF9D
R19NRU0pOworCXRzdF9jZ3JvdXBfcmVxdWlyZShUU1RfQ0dST1VQX01FTU9SWSwgTlVMTCk7CiB9
CiAKIHN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKIHsKLQl0c3RfY2dyb3VwX3Vtb3VudChQQVRI
X1RNUF9DR19NRU0pOworCXRzdF9jZ3JvdXBfY2xlYW51cChOVUxMKTsKIH0KIAogc3RydWN0IHRz
dF90ZXN0IHRlc3QgPSB7Ci0tIAoyLjI5LjIKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
