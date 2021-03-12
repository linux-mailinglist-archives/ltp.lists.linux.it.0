Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAADC339525
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:37:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB12A3C6860
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:37:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 68CD93C6858
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:37:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B7BF2600C5A
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:37:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C604AF8D
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 17:37:52 +0000 (UTC)
Date: Fri, 12 Mar 2021 18:37:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YEum7l1mTHutae2a@pevik>
References: <20210309171104.30821-1-mdoucha@suse.cz> <YEtCWbqdGq5Yc99s@pevik>
 <f775b926-6bd1-2f93-707a-fbbc7ebe6dc4@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f775b926-6bd1-2f93-707a-fbbc7ebe6dc4@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add FS quota availability check functions
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTWFydGluLAoKPiA+PiArCVRFU1QocXVvdGFjdGwoUUNNRChRX1FVT1RBT04sIFVTUlFVT1RB
KSwgZGV2aWNlLCBmb3JtYXQsIHF1b3RhZmlsZSkpOwo+ID4gQWN0dWFsbHksIHRoZXJlIGlzIGEg
d2FybmluZzoKPiA+IHRzdF9zdXBwb3J0ZWRfZnNfdHlwZXMuYzogSW4gZnVuY3Rpb24g4oCYdHN0
X2NoZWNrX3F1b3RhX3N1cHBvcnTigJk6Cj4gPiB0c3Rfc3VwcG9ydGVkX2ZzX3R5cGVzLmM6MTE3
OjU5OiB3YXJuaW5nOiBwYXNzaW5nIGFyZ3VtZW50IDQgb2Yg4oCYcXVvdGFjdGzigJkgZGlzY2Fy
ZHMg4oCYY29uc3TigJkgcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdkaXNj
YXJkZWQtcXVhbGlmaWVyc10KPiA+ICAgMTE3IHwgIFRFU1QocXVvdGFjdGwoUUNNRChRX1FVT1RB
T04sIFVTUlFVT1RBKSwgZGV2aWNlLCBmb3JtYXQsIHF1b3RhZmlsZSkpOwoKPiA+IFdvdWxkIHlv
dSBwcmVmZXIgdG8gY2FzdCB0byBjaGFyICosIG9yIGp1c3QgY2hhbmdlIGZ1bmN0aW9uIHBhcmFt
ZXRlciB0byBjaGFyICo/Cgo+IFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4gUGFzc2luZyBzdHJp
bmcgbGl0ZXJhbHMgdG8gdGhlIGZ1bmN0aW9uCj4gZGlyZWN0bHkgaXMgdGVjaG5pY2FsbHkgd3Jv
bmcgc28gSSdsbCBkcm9wIHRoZSBjb25zdCBhbmQgZml4IHRoZSB0ZXN0cwo+IHRvIGFsbG9jYXRl
IGEgYnVmZmVyIGZvciBxdW90YWZpbGUgcGF0aHMuIEknbGwgcmVzdWJtaXQgb24gTW9uZGF5LgpU
aGFua3MgYSBsb3QhCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
