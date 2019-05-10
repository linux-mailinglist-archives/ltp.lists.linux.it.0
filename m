Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB61A303
	for <lists+linux-ltp@lfdr.de>; Fri, 10 May 2019 20:31:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B44033EA37A
	for <lists+linux-ltp@lfdr.de>; Fri, 10 May 2019 20:31:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E4E0D3EA13F
 for <ltp@lists.linux.it>; Fri, 10 May 2019 20:31:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9C4951A016EE
 for <ltp@lists.linux.it>; Fri, 10 May 2019 20:31:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 49C87AEF3;
 Fri, 10 May 2019 18:31:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 May 2019 20:31:29 +0200
Message-Id: <20190510183132.31039-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510183132.31039-1-pvorel@suse.cz>
References: <20190510183132.31039-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 3/6] tst_net.sh: Add -a IP and -s options to
	tst_init_iface()
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

U2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0tLQogdGVzdGNhc2Vz
L2xpYi90c3RfbmV0LnNoIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90ZXN0Y2FzZXMvbGliL3RzdF9uZXQuc2ggYi90ZXN0Y2FzZXMvbGliL3RzdF9u
ZXQuc2gKaW5kZXggZjQ3YTQwNGQwLi5mYjhjNDk0NTkgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9s
aWIvdHN0X25ldC5zaAorKysgYi90ZXN0Y2FzZXMvbGliL3RzdF9uZXQuc2gKQEAgLTEsNyArMSw3
IEBACiAjIS9iaW4vc2gKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0
ZXIKICMgQ29weXJpZ2h0IChjKSAyMDE0LTIwMTcgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRl
cy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KLSMgQ29weXJpZ2h0IChjKSAyMDE2LTIwMTggUGV0ciBW
b3JlbCA8cHZvcmVsQHN1c2UuY3o+CisjIENvcHlyaWdodCAoYykgMjAxNi0yMDE5IFBldHIgVm9y
ZWwgPHB2b3JlbEBzdXNlLmN6PgogIyBBdXRob3I6IEFsZXhleSBLb2RhbmV2IDxhbGV4ZXkua29k
YW5ldkBvcmFjbGUuY29tPgogCiBbIC1uICIkVFNUX0xJQl9ORVRfTE9BREVEIiBdICYmIHJldHVy
biAwCkBAIC00NDYsMTQgKzQ0NiwzMCBAQCB0c3RfaW5pdF9pZmFjZSgpCiAJdHN0X3Job3N0X3J1
biAtYyAiaXAgbGluayBzZXQgJGlmYWNlIHVwIgogfQogCi0jIHRzdF9hZGRfaXBhZGRyIFtUWVBF
XSBbTElOS10KLSMgVFlQRTogeyBsaG9zdCB8IHJob3N0IH07IERlZmF1bHQgdmFsdWUgaXMgJ2xo
b3N0Jy4KLSMgTElOSzogbGluayBudW1iZXIgc3RhcnRpbmcgZnJvbSAwLiBEZWZhdWx0IHZhbHVl
IGlzICcwJy4KKyMgdHN0X2FkZF9pcGFkZHIgW1RZUEVdIFtMSU5LXSBbLWEgSVBdIFstc10KKyMg
T3B0aW9uczoKKyMgVFlQRTogeyBsaG9zdCB8IHJob3N0IH0sIGRlZmF1bHQgdmFsdWUgaXMgJ2xo
b3N0JworIyBMSU5LOiBsaW5rIG51bWJlciBzdGFydGluZyBmcm9tIDAsIGRlZmF1bHQgdmFsdWUg
aXMgJzAnCisjIC1hIElQOiBJUCBhZGRyZXNzIHRvIGJlIGFkZGVkLCBkZWZhdWx0IHZhbHVlIGlz
CisjICAgJCh0c3RfaXBhZGRyKS8kSVBWezQsNn1fe0wsUn1QUkVGSVgKKyMgLXMgc2FmZSBvcHRp
b24sIGlmIHNvbWV0aGluZyBnb2VzIHdyb25nLCB3aWxsIGV4aXQgd2l0aCBUQlJPSwogdHN0X2Fk
ZF9pcGFkZHIoKQogeworCWxvY2FsIGFkZHIgZGFkIGxzYWZlIG1hc2sgcnNhZmUKKworCWxvY2Fs
IE9QVElORAorCXdoaWxlIGdldG9wdHMgYTpzIG9wdDsgZG8KKwkJY2FzZSAiJG9wdCIgaW4KKwkJ
YSkgYWRkcj0iJE9QVEFSRyIgOzsKKwkJcykgbHNhZmU9IlJPRCI7IHJzYWZlPSItcyIgOzsKKwkJ
KikgdHN0X2JyayBUQlJPSyAidHN0X2FkZF9pcGFkZHI6IHVua25vd24gb3B0aW9uOiAkT1BUQVJH
IiA7OworCQllc2FjCisJZG9uZQorCXNoaWZ0ICQoKE9QVElORCAtIDEpKQorCiAJbG9jYWwgdHlw
ZT0iJHsxOi1saG9zdH0iCiAJbG9jYWwgbGlua19udW09IiR7MjotMH0iCi0JbG9jYWwgbWFzayBk
YWQKKwlsb2NhbCBpZmFjZT0kKHRzdF9pZmFjZSAkdHlwZSAkbGlua19udW0pCiAKIAlpZiBbICIk
VFNUX0lQVjYiIF07IHRoZW4KIAkJZGFkPSJub2RhZCIKQEAgLTQ2MSwxNyArNDc3LDE3IEBAIHRz
dF9hZGRfaXBhZGRyKCkKIAllbHNlCiAJCVsgIiR0eXBlIiA9ICJsaG9zdCIgXSAmJiBtYXNrPSRJ
UFY0X0xQUkVGSVggfHwgbWFzaz0kSVBWNF9SUFJFRklYCiAJZmkKLQotCWxvY2FsIGlmYWNlPSQo
dHN0X2lmYWNlICR0eXBlICRsaW5rX251bSkKKwlbIC1uICIkYWRkciIgXSB8fCBhZGRyPSIkKHRz
dF9pcGFkZHIgJHR5cGUpIgorCWVjaG8gJGFkZHIgfCBncmVwIC1xIC8gfHwgYWRkcj0iJGFkZHIv
JG1hc2siCiAKIAlpZiBbICR0eXBlID0gImxob3N0IiBdOyB0aGVuCi0JCXRzdF9yZXNfIFRJTkZP
ICJzZXQgbG9jYWwgYWRkciAkKHRzdF9pcGFkZHIpLyRtYXNrIgotCQlpcCBhZGRyIGFkZCAkKHRz
dF9pcGFkZHIpLyRtYXNrIGRldiAkaWZhY2UgJGRhZAorCQl0c3RfcmVzXyBUSU5GTyAic2V0IGxv
Y2FsIGFkZHIgJGFkZHIiCisJCSRsc2FmZSBpcCBhZGRyIGFkZCAkYWRkciBkZXYgJGlmYWNlICRk
YWQKIAkJcmV0dXJuICQ/CiAJZmkKIAotCXRzdF9yZXNfIFRJTkZPICJzZXQgcmVtb3RlIGFkZHIg
JCh0c3RfaXBhZGRyIHJob3N0KS8kbWFzayIKLQl0c3Rfcmhvc3RfcnVuIC1jICJpcCBhZGRyIGFk
ZCAkKHRzdF9pcGFkZHIgcmhvc3QpLyRtYXNrIGRldiAkaWZhY2UgJGRhZCIKKwl0c3RfcmVzXyBU
SU5GTyAic2V0IHJlbW90ZSBhZGRyICRhZGRyIgorCXRzdF9yaG9zdF9ydW4gJHJzYWZlIC1jICJp
cCBhZGRyIGFkZCAkYWRkciBkZXYgJGlmYWNlICRkYWQiCiB9CiAKICMgdHN0X3Jlc3RvcmVfaXBh
ZGRyIFtUWVBFXSBbTElOS10KLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
