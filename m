Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB361FB52E
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 16:57:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B484C3C2D04
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 16:57:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C3FFF3C1360
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 16:57:18 +0200 (CEST)
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0F0D010158A8
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 16:57:17 +0200 (CEST)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jlD1Q-0007u0-7x; Tue, 16 Jun 2020 16:57:08 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 76D76100F18; Tue, 16 Jun 2020 16:57:07 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Andy Lutomirski <luto@amacapital.net>
In-Reply-To: <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
References: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
 <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
Date: Tue, 16 Jun 2020 16:57:07 +0200
Message-ID: <87ftav2h4s.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Andy Lutomirski <luto@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QW5keSBMdXRvbWlyc2tpIDxsdXRvQGFtYWNhcGl0YWwubmV0PiB3cml0ZXM6Cj4+IE9uIEp1biAx
NiwgMjAyMCwgYXQgMTo0NCBBTSwgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
IHdyb3RlOgo+PiAKPj4g77u/a2VybmVsIHRlc3Qgcm9ib3QgPHJvbmcuYS5jaGVuQGludGVsLmNv
bT4gd3JpdGVzOgo+Pj4gRllJLCB3ZSBub3RpY2VkIHRoZSBmb2xsb3dpbmcgY29tbWl0IChidWls
dCB3aXRoIGdjYy05KToKPj4+IAo+Pj4gY29tbWl0OiAyYmJjNjhmODM3M2MwNjMxZWJmMTM3ZjM3
NmZiZWEwMGU4MDg2YmU3ICgieDg2L2VudHJ5OiBDb252ZXJ0IERlYnVnIGV4Y2VwdGlvbiB0byBJ
RFRFTlRSWV9EQiIpCj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQgbWFzdGVyCj4+IAo+PiBJcyB0aGUgaGVhZCBvZiBsaW51
eC5naXQgZXhwb3NpbmcgdGhlIHNhbWUgcHJvYmxlbSBvciBpcyB0aGlzIGFuCj4+IGludGVybWl0
dGVudCBmYWlsdXJlLCB3aGljaCBvbmx5IGFmZmVjdHMgYmlzZWN0YWJpbGl0eT8KPgo+IEl0IHN1
cmUgbG9va3MgZGV0ZXJtaW5pc3RpYzoKPgo+IHB0cmFjZTA4LmM6NjI6IEJST0s6IENhbm5vdCBm
aW5kIGFkZHJlc3Mgb2Yga2VybmVsIHN5bWJvbCAiZG9fZGVidWciCgpIYWhhaGFoYS4gQnV0IG5v
dCBvbmx5IExUUCwgYWxzbyBMS1AtdGVzdHMgbWFrZXMgYXNzdW1wdGlvbnM6CgogIG1vbml0b3Jz
L2lycV9leGNlcHRpb25fbm9pc2U6WyAiJGV4Y2VwdGlvbiIgLWVxICIxIiBdICYmIGV4cG9ydCBm
dHJhY2VfZmlsdGVycz0nX19kb19wYWdlX2ZhdWx0IGRvX2RpdmlkZV9lcnJvciBkb19vdmVyZmxv
dyBkb19ib3VuZHMgZG9faW52YWxpZF9vcCBkb19kZXZpY2Vfbm90X2F2YWlsYWJsZSBkb19kb3Vi
bGVfZmF1bHQgZG9fY29wcm9jZXNzb3Jfc2VnbWVudF9vdmVycnVuIGRvX2ludmFsaWRfVFNTIGRv
X3NlZ21lbnRfbm90X3ByZXNlbnQgZG9fc3B1cmlvdXNfaW50ZXJydXB0X2J1ZyBkb19jb3Byb2Nl
c3Nvcl9lcnJvciBkb19hbGlnbm1lbnRfY2hlY2sgZG9fc2ltZF9jb3Byb2Nlc3Nvcl9lcnJvciBk
b19kZWJ1ZyBkb19zdGFja19zZWdtZW50IGRvX2dlbmVyYWxfcHJvdGVjdGlvbicKCnN0YWJsZS1h
cGktbm9uc2Vuc2UucnN0IGNvbWVzIHRvIG15IG1pbmQuCgpUaGFua3MsCgogICAgICAgIHRnbHgK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
