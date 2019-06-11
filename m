Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C513D6D3
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:30:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADBA43EB0F7
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:30:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 236343EA9FB
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:30:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8EF33600926
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:30:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CA8BDAE24;
 Tue, 11 Jun 2019 19:30:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 Jun 2019 21:30:18 +0200
Message-Id: <20190611193021.17651-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611193021.17651-1-pvorel@suse.cz>
References: <20190611193021.17651-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Ignaz Forster <iforster@suse.de>
Subject: [LTP] [PATCH v3 1/4] ima: Call test's cleanup inside ima_setup.sh
	cleanup
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

dG8gd29yayB0aGUgc2FtZSB3YXkgYXMgc2V0dXAKCkFja2VkLWJ5OiBNaW1pIFpvaGFyIDx6b2hh
ckBsaW51eC5pYm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5j
ej4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1h
X3NldHVwLnNoICB8IDYgKysrKystCiAuLi4va2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEv
dGVzdHMvaW1hX3Zpb2xhdGlvbnMuc2ggICB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwv
c2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfc2V0dXAuc2ggYi90ZXN0Y2FzZXMva2Vy
bmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX3NldHVwLnNoCmluZGV4IDUyNTUx
MTkwYS4uY2JkZWQ0MmMyIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2lu
dGVncml0eS9pbWEvdGVzdHMvaW1hX3NldHVwLnNoCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2Vj
dXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfc2V0dXAuc2gKQEAgLTIwLDcgKzIwLDggQEAK
IFRTVF9URVNURlVOQz0idGVzdCIKIFRTVF9TRVRVUF9DQUxMRVI9IiRUU1RfU0VUVVAiCiBUU1Rf
U0VUVVA9ImltYV9zZXR1cCIKLVRTVF9DTEVBTlVQPSIke1RTVF9DTEVBTlVQOi1pbWFfY2xlYW51
cH0iCitUU1RfQ0xFQU5VUF9DQUxMRVI9IiRUU1RfQ0xFQU5VUCIKK1RTVF9DTEVBTlVQPSJpbWFf
Y2xlYW51cCIKIFRTVF9ORUVEU19UTVBESVI9MQogVFNUX05FRURTX1JPT1Q9MQogCkBAIC05NSw2
ICs5Niw5IEBAIGltYV9zZXR1cCgpCiBpbWFfY2xlYW51cCgpCiB7CiAJbG9jYWwgZGlyCisKKwlb
IC1uICIkVFNUX0NMRUFOVVBfQ0FMTEVSIiBdICYmICRUU1RfQ0xFQU5VUF9DQUxMRVIKKwogCWZv
ciBkaXIgaW4gJFVNT1VOVDsgZG8KIAkJdW1vdW50ICRkaXIKIAlkb25lCmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX3Zpb2xhdGlv
bnMuc2ggYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1h
X3Zpb2xhdGlvbnMuc2gKaW5kZXggNzQyMjNjMjIxLi5hNDRiZDEyMzAgMTAwNzU1Ci0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfdmlvbGF0aW9u
cy5zaAorKysgYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMv
aW1hX3Zpb2xhdGlvbnMuc2gKQEAgLTUxLDggKzUxLDYgQEAgY2xlYW51cCgpCiB7CiAJWyAiJFBS
SU5US19SQVRFX0xJTUlUIiAhPSAiMCIgXSAmJiBcCiAJCXN5c2N0bCAtd3Ega2VybmVsLnByaW50
a19yYXRlbGltaXQ9JFBSSU5US19SQVRFX0xJTUlUCi0KLQlpbWFfY2xlYW51cAogfQogCiBvcGVu
X2ZpbGVfcmVhZCgpCi0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
