Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B31427DAD
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 15:05:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C57E43EA5BF
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 15:05:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4FA423EA1AB
 for <ltp@lists.linux.it>; Thu, 23 May 2019 15:05:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BE0C11000B63
 for <ltp@lists.linux.it>; Thu, 23 May 2019 15:05:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23DAEAF7C;
 Thu, 23 May 2019 13:05:49 +0000 (UTC)
Date: Thu, 23 May 2019 15:05:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190523130547.GA18816@dell5510>
References: <20190510183132.31039-1-pvorel@suse.cz>
 <20190510183132.31039-2-pvorel@suse.cz>
 <25af53c5-dcfc-93b0-b9cb-4d179d485548@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25af53c5-dcfc-93b0-b9cb-4d179d485548@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH v2 1/6] net/route: Remove route{4, 6}-change-if
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

SGkgQWxleGV5LAoKPiBIaSBQZXRyLAo+IE9uIDUvMTAvMTkgOTozMSBQTSwgUGV0ciBWb3JlbCB3
cm90ZToKPiA+IFRoZXNlIHRlc3RzdWl0ZXMgcmVxdWlyZXMgMyBOSUMgc2V0dXAsIHdoaWNoIGlz
IG5vdCBzdXBwb3J0ZWQgYnkgbmV0d29yawo+ID4gbmFtZXNwYWNlIHNldHVwIChzaW5nbGUgaG9z
dCBjb25maWd1cmF0aW9uKSBhbmQgSU1ITyBub3QgY29tbW9uIGZvciB0d28KPiA+IGhvc3QgY29u
ZmlndXJhdGlvbiBlaXRoZXIuCgo+IEkgZ3Vlc3MsIHRoZSB0aGlyZCBpbnRlcmZhY2UgY2FuIGJl
IGVhc2lseSBjcmVhdGVkIGR1cmluZyB0aGUgc2V0dXAsIG9uIHRoZQo+IGxob3N0Li4uIHRoaXMg
aXMgd2hhdCdzIHJlcXVpcmVkLCByaWdodD8KCj4gRm9yIGV4YW1wbGUsIGJ5IGFkZGluZyBtYWN2
bGFuIHRvIHRoZSB0ZXN0IGludGVyZmFjZToKCj4gICBpcCBsaW5rIGFkZCBsdHBfbXYwIGxpbmsg
JCh0c3RfaWZhY2UpIHR5cGUgbWFjdmxhbiBtb2RlIGJyaWRnZQoKCj4gVGhlbiwgZm9yIHRoZSB0
ZXN0IHJvdXRlIHdlIGNhbiBzZXQgZWl0aGVyIGx0cF9tdjAgb3IgJCh0c3RfaWZhY2UpIGludGVy
ZmFjZS4KClRoYW5rcyBmb3IgcmV2aWV3LiBJJ2QgcHJlZmVyIHRvIGhhdmUgdGhpcyBzdXBwb3J0
IGluIHRzdF9uZXQuc2ggYXMgaXQgY2FuIGJlCm5lZWRlZCBmb3Igc29tZSB0ZXN0cyBpbiB0aGUg
ZnV0dXJlLCBzbyB3aHkgcmVpbnZlbnQgYSB3aGVlbD8gUHJvYmFibHkgdmlhIHNvbWUKdmFyaWFi
bGUgKGUuZy46IFRTVF9ORVRfRVhUUkFfTkVUTlNfSUZBQ0VTPTIgPT4gd291bGQgYWRkIDIgbW9y
ZSBpbnRlcmZhY2VzKS4KQnV0IG1heWJlIG5vdCBldmVyeSBzaW5nbGUgdGhpbmcgbXVzdCBiZSBp
biB0aGUgbGlicmFyeS4uLgoKTXVjaCBtb3JlIGltcG9ydGFudCB0aGluZyBpcyBob3cgdG8gc29s
dmUgdmFsaWRhdGlvbiB3aGVuIHJvdXRlLWNoYW5nZS1kc3QKb24gSVB2NiByZXF1aXJlcyB1c2lu
ZyByaG9zdCBhbmQgd2hldGhlciB1c2luZyBDIGJyaW5ncyBhIGJlbmVmaXQgKG5leHQKcGF0Y2hl
cyBpbiB0aGlzIHBhdGNoLXNldCkuCkZpcnN0IEkgd2FudGVkIHRvIHVzZSBpdCBiZWNhdXNlIHNw
ZWVkOiBmYXN0ZXIgY2hhbmdlcyBzdHJlc3Mgc3lzdGVtIG1vcmUKZWZmaWNpZW50bHksIGJ1dCB2
YWxpZGF0aW9uIG1pZ2h0IHNsb3dzIGl0IGRvd24gYW55d2F5LgpWYWxpZGF0aW9uOiBJIGdpdmUg
dXAgYmVjYXVzZSBzZXJ2ZXIgYXBwIHVzaW5nIHRocmVhZHMgKGVhY2ggYmluZGVkIHRvIGl0J3Mg
b3duCklQKSB3YXMgdG9vIHNsb3cgYW5kIHdpdGggY2xpZW50IHdhaXRpbmcgZm9yIHNlcnZlciB0
byBiZSB1cCBsb29rZWQgdG8gbWUgdGhhdAp2YWxpZGF0aW9uIGNvbXBsaWNhdGVzIHRoZSB0ZXN0
IGEgbG90LiBCdXQgbWF5YmUgaW5zdGVhZCBvZiB0aHJlYWRpbmcgcnVubmluZwpqdXN0IHNldmVy
YWwgc2luZ2xlIHRocmVhZCBpbnN0YW5jZXMgd291bGQgYmUgZmFzdGVyLgoKS2luZCByZWdhcmRz
LApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
