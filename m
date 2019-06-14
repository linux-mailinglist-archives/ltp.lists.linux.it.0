Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189D46B48
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 22:54:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C202E294AD4
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 22:54:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DD6F9294AB4
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 22:54:14 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A2371000A83
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 22:54:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2F384308427E
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 20:54:11 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6D2D5C29A
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 20:54:10 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 14 Jun 2019 22:54:02 +0200
Message-Id: <67bee9aca637a86b8101b122d149094b50397553.1560545529.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 14 Jun 2019 20:54:11 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] mtest06: tweak DISTANT_MMAP_SIZE
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

QWxsb2NhdGluZyBmdXJ0aGVyIGF3YXkgd29ya3MgYXMgYSBiZXR0ZXIgcmVwcm9kdWNlciBmb3I6
CiAgN2EzMGRmNDlmNjNhICgibW06IG1tdV9nYXRoZXI6IHJlbW92ZSBfX3RsYl9yZXNldF9yYW5n
ZSgpIGZvciBmb3JjZSBmbHVzaCIpCgpTaWduZWQtb2ZmLWJ5OiBKYW4gU3RhbmNlayA8anN0YW5j
ZWtAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL21lbS9tdGVzdDA2L21tYXAxLmMg
fCAxMSArKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL21lbS9tdGVzdDA2L21tYXAx
LmMgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9tdGVzdDA2L21tYXAxLmMKaW5kZXggYjdiNzQyNjUz
MTE0Li41MGQyZGFmYmQ5NTIgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL210ZXN0
MDYvbW1hcDEuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9tdGVzdDA2L21tYXAxLmMKQEAg
LTEyLDggKzEyLDExIEBACiAgKiBiZXR3ZWVuIG1tYXAvbXVubWFwIHdvcmtlZCwgdGhlbiBpdHMg
dmFsdWUgbXVzdCBtYXRjaCBleHBlY3RlZAogICogdmFsdWUuCiAgKgotICogQ2FuIHRyaWdnZXIg
cGFuaWNzL3N0YWxscyBzaW5jZSBhdCBsZWFzdCA0LjE0IG9uIHNvbWUgYXJjaGVzLiBTZWU6Cisg
KiBDYW4gdHJpZ2dlciBwYW5pY3Mvc3RhbGxzIHNpbmNlIGF0IGxlYXN0IDQuMTQgb24gc29tZSBh
cmNoZXM6CiAgKiAgIGZjOGVmZDJkZGZlZCAoIm1tL21lbW9yeS5jOiBkb19mYXVsdDogYXZvaWQg
dXNhZ2Ugb2Ygc3RhbGUgdm1fYXJlYV9zdHJ1Y3QiKQorICogQ2FuIHRyaWdnZXIgdXNlci1zcGFj
ZSBzdGFsbHMgb24gYWFyY2g2NDoKKyAqICAgN2EzMGRmNDlmNjNhICgibW06IG1tdV9nYXRoZXI6
IHJlbW92ZSBfX3RsYl9yZXNldF9yYW5nZSgpIGZvciBmb3JjZSBmbHVzaCIpCisgKiAgIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzE4MTc4Mzk1MzMuMjA5OTY1NTIuMTU1NzA2NTQ0
NTIzMy5KYXZhTWFpbC56aW1icmFAcmVkaGF0LmNvbQogICovCiAjaW5jbHVkZSA8ZXJybm8uaD4K
ICNpbmNsdWRlIDxmbG9hdC5oPgpAQCAtMjUsNyArMjgsMTEgQEAKICNpbmNsdWRlICJ0c3RfdGVz
dC5oIgogI2luY2x1ZGUgInRzdF9zYWZlX3B0aHJlYWQuaCIKIAotI2RlZmluZSBESVNUQU5UX01N
QVBfU0laRSAoNjQqMTAyNCoxMDI0KQorI2lmZGVmIFRTVF9BQkkzMgorIyAgZGVmaW5lIERJU1RB
TlRfTU1BUF9TSVpFICgyNTYqMTAyNCoxMDI0KQorI2Vsc2UKKyMgIGRlZmluZSBESVNUQU5UX01N
QVBfU0laRSAoMkwqMTAyNCoxMDI0KjEwMjQpCisjZW5kaWYKICNkZWZpbmUgVEVTVF9GSUxFTkFN
RSAiYXNoZmlsZSIKIAogLyogc2Vjb25kcyByZW1haW5pbmcgYmVmb3JlIHJlYWNoaW5nIHRpbWVv
dXQgKi8KLS0gCjEuOC4zLjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
