Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C5132963
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 09:26:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 681312D0154
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 09:26:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 779BA3EB179
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 09:26:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 089E160065C
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 09:26:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 538C0AFBD;
 Mon,  3 Jun 2019 07:26:03 +0000 (UTC)
Date: Mon, 3 Jun 2019 09:26:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190603072605.GB14710@dell5510>
References: <20190510183132.31039-1-pvorel@suse.cz>
 <187fa31b-3295-6f1f-e330-1373b2fb4c66@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <187fa31b-3295-6f1f-e330-1373b2fb4c66@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH v2 0/6] net/route: Rewrite route{4,
 6}-change-{dst, gw} into C
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

SGkgQWxleGV5LAoKdGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBJIHN1cHBvc2UgeW91IGRvbid0
IHNlZSBtdWNoIHBvaW50IG9mIHJld3JpdGluZyB0ZXN0cwppbnRvIEMgKGFuZCBkZXBlbmRpbmcg
b24gbGlibW5sKS4gVGhlIG9yaWdpbmFsIGlkZWEgd2FzIHRvIGNoYW5nZSBpdCBmYXN0IGVub3Vn
aAp3aXRoIEMgdG8gcmVhbGx5IHN0cmVzcyBpdC4gT0ssIGxldCdzIGxlYXZlIGl0IDopLgoKPiA+
IGRvX3Rlc3QoKQo+ID4gewo+ID4gCWxvY2FsIGlmYWNlPSQodHN0X2lmYWNlKQo+ID4gCWxvY2Fs
IGFkZHIgbmV3X3J0Cgo+ID4gCW5ld19ydD0iJCh0c3RfaXBhZGRyX3VuICQxKS8kbWFzayIKPiA+
IAlhZGRyPSIkKHRzdF9pcGFkZHJfdW4gJDEgMSkiCgo+ID4gCXRzdF9yZXMgVElORk8gInRlc3Rp
bmcgcm91dGUgJyRuZXdfcnQnIgoKPiA+IAl0c3Rfcmhvc3RfcnVuIC1zIC1jICJpcCBhZGRyIGFk
ZCAkYWRkci8kbWFzayBkZXYgJCh0c3RfaWZhY2Ugcmhvc3QpIgo+ID4gCVJPRCBpcCByb3V0ZSBh
ZGQgJG5ld19ydCBkZXYgJGlmYWNlCj4gPiAJUk9EIGlwIG5laWdoIHJlcGxhY2UgJGFkZHIgbGxh
ZGRyICQodHN0X2h3YWRkciByaG9zdCkgbnVkIHBlcm1hbmVudCBkZXYgJGlmYWNlCj4gPiA+IAlF
WFBFQ1RfUEFTUyBucy11ZHBzZW5kZXIgLWYgJFRTVF9JUFZFUiAtRCAkYWRkciAtcCAkMSAtbyAt
cyAkdWRwX3NpemUKCj4gPiAJUk9EIGlwIG5laWdoIGRlbCAkYWRkciBsbGFkZHIgJCh0c3RfaHdh
ZGRyIHJob3N0KSBkZXYgJGlmYWNlCj4gPiAJUk9EIGlwIHJvdXRlIGRlbCAkbmV3X3J0IGRldiAk
aWZhY2UKPiA+IAl0c3Rfcmhvc3RfcnVuIC1jICJpcCBhZGRyIGRlbCAkYWRkci8kbWFzayBkZXYg
JCh0c3RfaWZhY2Ugcmhvc3QpIgoKPiBXaXRoIG5zLXVkcHNlbmRlciwgSSB0aGluayBpdCBjYW4g
YmUgd2l0aG91dCBzZXR0aW5nIGlwIGFkZHJlc3NlczoKUm91dGUgb3ZlciBnYXRld2F5IHJlcXVp
cmVzIChvbiBJUHY2KSBnYXRld2F5IG9uIHJob3N0LCB3aGljaCBpcyByZXF1aXJlcyB0bwpjcmVh
dGUgdGhpcyBJUCBhZGRyZXNzIGZpcnN0LgoKPiAgCVJPRCBpcCByb3V0ZSBhZGQgJG5ld19ydCBk
ZXYgJGlmYWNlCj4gIAlST0QgaXAgbmVpZ2ggcmVwbGFjZSAkYWRkciBsbGFkZHIgJCh0c3RfaHdh
ZGRyIHJob3N0KSBudWQgcGVybWFuZW50IGRldiAkaWZhY2UKPiAgCUVYUEVDVF9QQVNTIG5zLXVk
cHNlbmRlciAtZiAkVFNUX0lQVkVSIC1EICRhZGRyIC1wICQxIC1vIC1zICR1ZHBfc2l6ZT4gCj4g
CVJPRCBpcCBuZWlnaCBkZWwgJGFkZHIgbGxhZGRyICQodHN0X2h3YWRkciByaG9zdCkgZGV2ICRp
ZmFjZQo+ICAJUk9EIGlwIHJvdXRlIGRlbCAkbmV3X3J0IGRldiAkaWZhY2UKCj4gQnV0IHdpdGgg
cGluZyBhbmQgbmVpZ2hib3IgZGlzY292ZXJ5Ogo+ICAJdHN0X3Job3N0X3J1biAtcyAtYyAiaXAg
YWRkciBhZGQgJGFkZHIvJG1hc2sgZGV2ICQodHN0X2lmYWNlIHJob3N0KSIKPiAgCVJPRCBpcCBy
b3V0ZSBhZGQgJG5ld19ydCBkZXYgJGlmYWNlCj4gIAlFWFBFQ1RfUEFTUyBwaW5nJFRTVF9JUFZF
UiAuLi4KPiAgCVJPRCBpcCByb3V0ZSBkZWwgJG5ld19ydCBkZXYgJGlmYWNlCj4gIAl0c3Rfcmhv
c3RfcnVuIC1jICJpcCBhZGRyIGRlbCAkYWRkci8kbWFzayBkZXYgJCh0c3RfaWZhY2Ugcmhvc3Qp
IgpJIHByZWZlciB1c2luZyBwaW5nIGFuZCBuZWlnaGJvciBkaXNjb3ZlcnkuIEkgc3VwcG9zZSB0
aGVzZSBhcmUgYm90aCBlcXVpdmFsZW50CihpZiBub3QgaXQnZCBiZSBnb29kIHRvIHJ1biB0aGVt
IGJvdGgpLgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
