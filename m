Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC2230A4
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 11:49:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E5F83EA7D4
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 11:49:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id F19F43EA79E
 for <ltp@lists.linux.it>; Mon, 20 May 2019 11:49:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 228FA60164F
 for <ltp@lists.linux.it>; Mon, 20 May 2019 11:49:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFF5FAE34;
 Mon, 20 May 2019 09:49:50 +0000 (UTC)
Date: Mon, 20 May 2019 11:49:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190520094949.GA25405@rei.lan>
References: <20190520041730.28238-1-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520041730.28238-1-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH 0/1] Fix return value checks for posix apis
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

SGkhCj4gVGhpcyBpcyBhbiBSRkMgcGF0Y2ggdG8gZGVtb25zdHJhdGUgdGhhdCBtb3N0IG9mIHRo
ZSBwdGhyZWFkXyogY2FsbHMKPiBpbiB0aGUgb3Blbl9wb3NpeF90ZXN0c3VpdGUgc2VlbSB0byBi
ZSBkb2luZyB0aGUgcmV0dXJuIHZhbHVlIGNoZWNrcwo+IGluY29ycmVjdGx5LiBNb3N0IHBvc2l4
XyogYXBpcyByZXR1cm4gcG9zaXRpdmUgZXJybm8gb24gZmFpbHVyZSBhbmQgMCBvbgo+IHN1Y2Nl
c3MuCgpUaGlzIGlzIHVuZm9ydHVuYXRlbHkgY29tbW9uIG1pc2NvbmNlcHRpb24sIGFsc28gSSBn
dWVzcyB5b3UgbWVhbnQKcHRocmVhZF8qIEFQSXMgaGVyZS4KCj4gUEFUQ0ggMS8xIGRlbW9uc3Ry
YXRlcyB0aGUgZml4ZXMgbmVlZGVkIGZvciBwdGhyZWFkX3NpZ21hc2svNi0xIGZvcgo+IGV4YW1w
bGUuIFRoaXMgcGF0dGVybiBpcyBmYWlybHkgd2lkZXNwcmVhZCBpbiBvcGVuX3Bvc2l4X3Rlc3Rz
dWl0ZS4KPiAKPiBBZnRlciBnb2luZyB0aHJvdWdoIHRoZSBkb2N1bWVudGF0aW9uIGluIHRoZSBw
cm9qZWN0LCBJIHdhc24ndCBzdXJlIGlmIEkKPiB0ZXN0ZWQgdGhpcyBjb3JyZWN0bHkuIEFmdGVy
IGJ1aWxkaW5nLCBJIHRyaWVkIHRoZSBmb2xsb3dpbmcKPiAKPiAkIGNkIHRlc3RjYXNlcy9vcGVu
X3Bvc2l4X3Rlc3RzdWl0ZQo+ICQgLi9iaW4vcnVuX3Rlc2l0LnNoIGNvbmZvcm1hbmNlL2ludGVy
ZmFjZXMvcHRocmVhZF9zaWdtYXNrIHB0aHJlYWRfc2lnbWFza182LTEucnVuLXRlc3QKPiAKPiAu
Li5hbmQgdGhhdCBrZWVwcyBydW5uaW5nIGludG8gdGVzdCBiZWluZyBza2lwcGVkIGR1ZSB0byBt
aXNzaW5nIGZpbGUuCj4gKEkgZG8gaGF2ZSBwdGhyZWFkX3NpZ21hc2tfNi0xLnJ1bi10ZXN0IGlu
IHBsYWNlKS4KCkFjdHVhbGx5IEkgYWx3YXlzIGp1c3QgcnVuIHRoZSBiaW5hcnksIHNvIGluIHRo
aXMgY2FzZSBkb2luZwouL3B0aHJlYWRfc2lnbWFza182LTEucnVuLXRlc3Qgc2hvdWxkIHN1ZmZp
Y2UuCgo+IFNvLCBjb25zaWRlciB0aGlzIGJ1aWxkIHRlc3RlZCBvbmx5IGZvciBub3cuIEknZCBs
b3ZlIHRvIGtub3cgaG93IHdlIGNhbgo+IHRlc3QgdGhpcyBhbmQgaWYgd2UgYXJlIHN0aWxsIHVz
aW5nIHRoZSB0ZXN0c3VpdGUsIHRoZW4gSSBhbSBoYXBweSB0bwo+IGZpeCByZXN0IG9mIHRoZSBw
bGFjZXMgd2hlcmUgaXRzIGJyb2tlbi4KClNvdW5kcyBnb29kLgoKLS0gCkN5cmlsIEhydWJpcwpj
aHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
