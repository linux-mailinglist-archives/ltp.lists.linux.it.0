Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9144E4C9
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 11:53:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 699853EAEAE
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 11:53:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BA6203EA251
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 11:53:47 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id F07C9601081
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 11:53:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,398,1557158400"; d="scan'208";a="68421297"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jun 2019 17:53:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 681394CD9588
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 17:53:37 +0800 (CST)
Received: from localhost.localdomain (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 21 Jun 2019 17:53:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 21 Jun 2019 17:53:26 +0800
Message-ID: <1561110806-2734-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 681394CD9588.AB43D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] daemonlib.sh: call tty before executing service
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

T24gbXkgbWFjaGluZSwgcG9sa2l0LTAuMTEyLTIyLmVsNy54ODZfNjQgaGFzIGNvbnRhaW5lZCB0
aGUgWzFdIHBhdGNoLgoKVGhpcyBwYXRjaCBsZWFkcyBzZXJ2aWNlIGFjaXRvbnMoc3VjaCBhcyBy
ZXN0YXJ0KSBkb24ndCBzdG9wIGlmIGl0IGRvZXNuJ3QKZmluZCBjb250cm9sbGluZyB0ZXJtaW5h
bC4gRXZlbiB0aGUgc2VydmljZSBoYXMgYmVlbiBleGVjdXRlZCBzdWNjZXNzZnVsbHkuCllvdSBj
YW4gcmVwcm9kdWNlIGl0IHdpdGggdGhlIGZvbGxvd2luZyBjb2RlOgoKdGVzdC5zaAotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmVjaG8gInJlc3RhcnQgZGFl
bW9uIgpzeXN0ZW1jdGwgcmVzdGFydCByc3lzbG9nLnNlcnZpY2UgPi9kZXYvbnVsbCAyPiYxCmVj
aG8gInJlc3RhcnQgc3VjY2VzcyIKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQouL3Rlc3Quc2ggJiAgKGl0IGRvZXNuJ3Qgc3RvcCkKcmVzdGFydCBkYWVtb24K
CnBzIC1hdXhmCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCi4uLi4gcHRzLzEgICAgVCAgICAgIFxfIC9iaW4vYmFzaCAuL3Rlc3Quc2gKLi4uLiBwdHMv
MSAgICBUICAgICAgICBcXyBzeXN0ZW1jdGwgcmVzdGFydCByc3lzbG9nLnNlcnZpY2UKLi4uLiBw
dHMvMSAgICBUbCAgICAgICAgIFxfIC91c3IvYmluL3BrdHR5YWdlbnQgLS1ub3RpZnktZmQgNgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgovdmFyL2xv
Zy9zZWN1cmUKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CnBvbGtpdGRbMTMxMF06IFJlZ2lzdGVyZWQgQXV0aGVudGljYXRpb24gQWdlbnQgZm9yIHVuaXgt
cHJvY2VzczoxODQ3MjoyNTIzMjUgCihzeXN0ZW0gYnVzIG5hbWUgOjEuMTA1IFsvdXNyL2Jpbi9w
a3R0eWFnZW50IC0tbm90aWZ5LWZkIDYgLS1mYWxsYmFja10sIG9iamVjdApwYXRoIC9vcmcvZnJl
ZWRlc2t0b3AvUG9saWN5S2l0MS9BdXRoZW50aWNhdGlvbkFnZW50LCBsb2NhbGUgZW5fVVMuVVRG
LTgpCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKVGhp
cyBjaGFuZ2UgbGVhZHMgdG8gc3lzbG9nWzEtMTBdIHRlc3RjYXNlIGhhbmcuIEkgZml4IGl0IGJ5
IGFkZGluZyB0dHkgYmVmb3JjZQpzZXJ2aWNlLCBzbyB0aGVzZSBjYXNlcyBkb24ndCBoYW5nLgoK
KHBrdHR5YWdlbnQ6IFBvbGtpdEFnZW50VGV4dExpc3RlbmVyIGxlYXZlcyBlY2hvIHR0eSBkaXNh
YmxlZCBpZiBTSUdJTlQvU0lHVEVSTSkKWzFdaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3BvbGtpdC9wb2xraXQvY29tbWl0L2JmYjcyMmJiZTVhNTAzMDk1Y2M3ZTg2MGYyODJiMTQyZjVh
YTc1ZjEKClNpZ25lZC1vZmYtYnk6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5j
b20+Ci0tLQogdGVzdGNhc2VzL2xpYi9kYWVtb25saWIuc2ggfCAyNCArKysrKysrKysrKystLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvbGliL2RhZW1vbmxpYi5zaCBiL3Rlc3RjYXNlcy9s
aWIvZGFlbW9ubGliLnNoCmluZGV4IDBkZTNmODZhZi4uNTgwN2NiZWEwIDEwMDY0NAotLS0gYS90
ZXN0Y2FzZXMvbGliL2RhZW1vbmxpYi5zaAorKysgYi90ZXN0Y2FzZXMvbGliL2RhZW1vbmxpYi5z
aApAQCAtNDcsNDMgKzQ3LDQzIEBAIGZpCiBzdGFydF9kYWVtb24oKQogewogCWlmIFsgJEhBVkVf
U1lTVEVNQ1RMIC1lcSAxIF07IHRoZW4KLQkJc3lzdGVtY3RsIHN0YXJ0ICQxLnNlcnZpY2UgPiAv
ZGV2L251bGwgMj4mMQorCQl0dHkgfCBzeXN0ZW1jdGwgc3RhcnQgJDEuc2VydmljZSA+IC9kZXYv
bnVsbCAyPiYxCiAJZWxpZiBjb21tYW5kIC12IHNlcnZpY2UgPi9kZXYvbnVsbCAyPiYxOyB0aGVu
Ci0JCXNlcnZpY2UgJDEgc3RhcnQgPiAvZGV2L251bGwgMj4mMQorCQl0dHkgfCBzZXJ2aWNlICQx
IHN0YXJ0ID4gL2Rldi9udWxsIDI+JjEKIAllbHNlCi0JCS9ldGMvaW5pdC5kLyQxIHN0YXJ0ID4g
L2Rldi9udWxsIDI+JjEKKwkJdHR5IHwvZXRjL2luaXQuZC8kMSBzdGFydCA+IC9kZXYvbnVsbCAy
PiYxCiAJZmkKIH0KIAogc3RvcF9kYWVtb24oKQogewogCWlmIFsgJEhBVkVfU1lTVEVNQ1RMIC1l
cSAxIF07IHRoZW4KLQkJc3lzdGVtY3RsIHN0b3AgJDEuc2VydmljZSA+IC9kZXYvbnVsbCAyPiYx
CisJCXR0eSB8IHN5c3RlbWN0bCBzdG9wICQxLnNlcnZpY2UgPiAvZGV2L251bGwgMj4mMQogCWVs
aWYgY29tbWFuZCAtdiBzZXJ2aWNlID4vZGV2L251bGwgMj4mMTsgdGhlbgotCQlzZXJ2aWNlICQx
IHN0b3AgPiAvZGV2L251bGwgMj4mMQorCQl0dHkgfCBzZXJ2aWNlICQxIHN0b3AgPiAvZGV2L251
bGwgMj4mMQogCWVsc2UKLQkJL2V0Yy9pbml0LmQvJDEgc3RvcCA+IC9kZXYvbnVsbCAyPiYxCisJ
CXR0eSB8IC9ldGMvaW5pdC5kLyQxIHN0b3AgPiAvZGV2L251bGwgMj4mMQogCWZpCiB9CiAKIHN0
YXR1c19kYWVtb24oKQogewogCWlmIFsgJEhBVkVfU1lTVEVNQ1RMIC1lcSAxIF07IHRoZW4KLQkJ
c3lzdGVtY3RsIGlzLWFjdGl2ZSAkMS5zZXJ2aWNlID4gL2Rldi9udWxsIDI+JjEKKwkJdHR5IHwg
c3lzdGVtY3RsIGlzLWFjdGl2ZSAkMS5zZXJ2aWNlID4gL2Rldi9udWxsIDI+JjEKIAllbGlmIGNv
bW1hbmQgLXYgc2VydmljZSA+L2Rldi9udWxsIDI+JjE7IHRoZW4KLQkJc2VydmljZSAkMSBzdGF0
dXMgPiAvZGV2L251bGwgMj4mMQorCQl0dHkgfCBzZXJ2aWNlICQxIHN0YXR1cyA+IC9kZXYvbnVs
bCAyPiYxCiAJZWxzZQotCQkvZXRjL2luaXQuZC8kMSBzdGF0dXMgPiAvZGV2L251bGwgMj4mMQor
CQl0dHkgfCAvZXRjL2luaXQuZC8kMSBzdGF0dXMgPiAvZGV2L251bGwgMj4mMQogCWZpCiB9CiAK
IHJlc3RhcnRfZGFlbW9uKCkKIHsKIAlpZiBbICRIQVZFX1NZU1RFTUNUTCAtZXEgMSBdOyB0aGVu
Ci0JCXN5c3RlbWN0bCByZXN0YXJ0ICQxLnNlcnZpY2UgPiAvZGV2L251bGwgMj4mMQorCQl0dHkg
fCBzeXN0ZW1jdGwgcmVzdGFydCAkMS5zZXJ2aWNlID4gL2Rldi9udWxsIDI+JjEKIAllbGlmIGNv
bW1hbmQgLXYgc2VydmljZSA+L2Rldi9udWxsIDI+JjE7IHRoZW4KLQkJc2VydmljZSAkMSByZXN0
YXJ0ID4gL2Rldi9udWxsIDI+JjEKKwkJdHR5IHwgc2VydmljZSAkMSByZXN0YXJ0ID4gL2Rldi9u
dWxsIDI+JjEKIAllbHNlCi0JCS9ldGMvaW5pdC5kLyQxIHJlc3RhcnQgPiAvZGV2L251bGwgMj4m
MQorCQl0dHkgfCAvZXRjL2luaXQuZC8kMSByZXN0YXJ0ID4gL2Rldi9udWxsIDI+JjEKIAlmaQog
fQotLSAKMi4xOC4xCgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
