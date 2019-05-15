Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E696F1EF53
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 13:32:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFC33294AEF
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 13:32:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 32C17294A9F
 for <ltp@lists.linux.it>; Wed, 15 May 2019 13:32:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2EA7C1401B3F
 for <ltp@lists.linux.it>; Wed, 15 May 2019 13:32:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7F9FAAF68;
 Wed, 15 May 2019 11:32:31 +0000 (UTC)
Date: Wed, 15 May 2019 13:32:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ignaz Forster <iforster@suse.de>
Message-ID: <20190515113229.GA22920@dell5510>
References: <20190405165225.27216-1-pvorel@suse.cz>
 <20190405165225.27216-4-pvorel@suse.cz>
 <810d4df7-1e5e-dd24-8b87-e0fa3edbd25f@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <810d4df7-1e5e-dd24-8b87-e0fa3edbd25f@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Fabian Vogt <FVogt@suse.com>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 3/3] ima: Add overlay test
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

SGkgSWduYXosCgo+IHRoYW5rcyBhIGxvdCBmb3IgeW91ciBjb250aW51ZWQgd29yayBvbiB0aGUg
SU1BIC8gRVZNIHRlc3RzIGFuZCBzb3JyeSBmb3IKPiBtaXNzaW5nIGZlZWRiYWNrIC0gdGhlIG1h
aWwgZ290IGxvc3QgaW4gbXkgc3RhY2sgb2YgVE9ETyBpdGVtcy4KTm90IGEgYmlnIGRlYWwgYW5k
IHRoYW5rcyBhIGxvdCBmb3IgYSBmZWVkYmFjayBhbmQgaW5mby4KCj4gQW0gMDUuMDQuMTkgdW0g
MTg6NTIgVWhyIHNjaHJpZWIgUGV0ciBWb3JlbDoKPiA+IFNob3VsZCBJIGNoZWNrIEVWTSBlbmFi
bGVkPwoKPiBBcyB0aGVzZSB0ZXN0cyByZXF1aXJlIGFuIGFwcHJvcHJpYXRlbHkgcHJlcGFyZWQg
bWFjaGluZSBhbnl3YXk6IEhvdyBhYm91dAo+IHByaW50aW5nIGEgbWVzc2FnZSB3aGV0aGVyIG9u
bHkgSU1BIG9yIGJvdGggSU1BIGFuZCBFVk0gYXJlIGVuYWJsZWQuIFRoZXNlCj4gdGVzdHMgbWFr
ZSBzZW5zZSBpbiBib3RoIGNhc2VzLCBzbyBJIHdvdWxkbid0IGJsb2NrIHRoZW0gb24gZWl0aGVy
IHNldHVwLgoKPiA+IC9zeXMva2VybmVsL3NlY3VyaXR5L2V2bSBzaG91bGQgYmUgMT8KCj4gWWVz
LCB0aGF0IHNob3VsZCBiZSBlbm91Z2ggdG8gZGV0ZWN0IHdoZXRoZXIgRVZNIGlzIGVuYWJsZWQu
Cgo+ID4gK3Rlc3QxKCkKPiA+ICt7Cj4gPiArCWxvY2FsIGZpbGU9ImZvbzEudHh0Igo+ID4gKwo+
ID4gKwl0c3RfcmVzIFRJTkZPICJvdmVyd3JpdGUgZmlsZSBpbiBvdmVybGF5Igo+ID4gKwlST0Qg
ZWNobyBsb3dlciBcPiAkbG93ZXIvJGZpbGUKPiA+ICsJRVhQRUNUX1BBU1MgZWNobyBvdmVybGF5
IFw+ICRtZXJnZWQvJGZpbGUKCj4gSXQgc2VlbXMgdGhlIHJlZGlyZWN0aW9uIC8gZXNjYXBpbmcg
aXMgd3JvbmcgaGVyZTogdGhlIHN0cmluZyAib3ZlcmxheSIKPiBuZXZlciBlbmRzIHVwIGluIHRo
ZSB0YXJnZXQgZmlsZS4KSSdtIHByZXR0eSBzdXJlIHRoYXQgJz4nIHNob3VsZCBiZSBlc2NhcGVk
IGZvciBib3RoIFJPRCBhbmQgRVhQRUNUX1BBU1MuCkVYUEVDVF9QQVNTIHNob3VsZCBmYWlsIChz
b21ldGhpbmcgbGlrZSAiZXZtX292ZXJsYXkgMSBURkFJTDogZWNobyBvdmVybGF5IC4uLgpmYWls
ZWQgdW5leHBlY3RlZGx5IikgaWYgIm92ZXJsYXkiIHN0cmluZyBkaWRuJ3QgZ2V0IGludG8gJG1l
cmdlZC8kZmlsZSBmaWxlLgpDYW4geW91IHNlbnQgd2hvbGUgb3V0cHV0PwoKS2luZCByZWdhcmRz
LApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
