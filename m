Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B31184F
	for <lists+linux-ltp@lfdr.de>; Thu,  2 May 2019 13:45:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F1BB3EAE55
	for <lists+linux-ltp@lfdr.de>; Thu,  2 May 2019 13:45:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 62DAE3EA2BD
 for <ltp@lists.linux.it>; Thu,  2 May 2019 13:45:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4DC6C10007D8
 for <ltp@lists.linux.it>; Thu,  2 May 2019 13:44:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DDB89ABD9;
 Thu,  2 May 2019 11:45:00 +0000 (UTC)
Date: Thu, 2 May 2019 13:44:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190502114459.GA32460@dell5510>
References: <20190427053929.7372-1-pvorel@suse.cz>
 <5cff91e0-c566-27c3-95dd-39dd4e2b6d0e@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cff91e0-c566-27c3-95dd-39dd4e2b6d0e@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/1] net/broken_ip: Rewrite into new API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQWxleGV5LAoKPiBBY2tlZC1ieTogQWxleGV5IEtvZGFuZXYgPGFsZXhleS5rb2RhbmV2QG9y
YWNsZS5jb20+Ci4uLgo+ID4gK2V4cG9ydCBJQ01QVjRfREFUQV9NQVhTSVpFPTE0NzIKPiA+ICtl
eHBvcnQgSUNNUFY2X0RBVEFfTUFYU0laRT0xNDUyCgo+IFNpbmNlIHRoZXNlIHZhcmlhYmxlcyBh
cmUgaW4gdGhlIGxpYnJhcnksIG1heSBiZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdHVuZQo+IHRo
ZW0gZGVwZW5kaW5nIG9uIGFuIE1UVSBvZiB0aGUgdGVzdHMgaW50ZXJmYWNlcz8KR29vZCBpZGVh
LiAxNDcyIGFuZCAxNDUyIGFyZSBiYXNlZCBvbiBNVFUgPSAxNTAwIChJUHY0OiAxNTAwIC0gMjAg
Ynl0ZXMgZm9yIElQdjQgaGVhZGVyCi0gOCBieXRlcyBmb3IgSUNNUCBoZWFkZXI7IElQdjY6IDE1
MDAgLSA0MCBieXRlcyBmb3IgSVB2NiBoZWFkZXIgLSA4IGJ5dGVzIGZvciBJQ01QIGhlYWRlciks
CndoaWNoIGxvb2tzIHRvIG1lIGFzIHRoZSBkZWZhdWx0IGZvciBuZXRucyBOSUNzIGFuZCBldGhl
cm5ldCBhbmQgd2lmaSBOSUNzLApidXQgd2Ugc2hvdWxkIGF2b2lkIGZhaWx1cmVzIHdoZW4gZGlm
ZmVyZW50IE1UVSB1c2VkLgpJIHByb3Bvc2UgbWVyZ2luZyB0aGlzIHZlcnNpb24gYW5kIGFkZCBN
VFUgZGV0ZWN0aW9uIHN1cHBvcnQgbGF0ZXIuCgpJIGd1ZXNzIHdlIGRvbid0IG5lZWQgdG8gY2hl
Y2sgLXMgdmFsdWVzIHBhc3NlZCB0byB0c3RfaWNtcCgpIChJIGd1ZXNzIG5vYm9keQpzZXQgTVRV
IDwgMTAwMCwgYWx0aG91Z2ggaXQncyBub3QgZm9yYmlkZGVuIGZvciBJUHY0KS4gQnV0IEknZCBh
ZGQgdGhpcyBjaGVjawphbHNvIGludG8gbnMtaWNtcHZbNDZdX3NlbmRlci5jLgoKKyBvZmYgY291
cnNlIG90aGVyIGNsZWFudXAgbGlrZSBtZXJnaW5nIG5zLWljbXB2WzQ2XV9zZW5kZXIuYyBpbnRv
IHNpbmdsZSBjb2RlIHdvdWxkIGJlIG5pY2UsCmJ1dCBmaXJzdCBJIHdhbnQgdG8gZmluaXNoIHJv
dXRlIHJld3JpdGluZy4KCj4gQWxzbyB3ZSBjYW4gc2VuZCBtb3JlIHdpdGggZnJhZ21lbnRhdGlv
biwgYnV0IEkgZ3Vlc3MgbnMtaWNtcHYgZG9lc24ndAo+IGhhdmUgcHJvcGVyIHN1cHBvcnQuLi4K
RG8geW91IG1lYW4gdG8gc2VuZCBwYWNrZXQgYmlnIGVub3VnaCB0byBoYXZlIGZyYWdtZW50YXRp
b24gb24gbGhvc3Q/Cisgc2V0c29ja29wdCBJUF9QTVRVRElTQ19ET05UPwoKS2luZCByZWdhcmRz
LApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
