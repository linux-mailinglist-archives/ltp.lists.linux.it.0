Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B7B4A322
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 15:59:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9CB3294ADC
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 15:59:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D0C06294AC2
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 15:59:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 850C8200AE0
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 15:59:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC1E7AEAF;
 Tue, 18 Jun 2019 13:59:22 +0000 (UTC)
Date: Tue, 18 Jun 2019 15:59:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ignaz Forster <iforster@suse.de>
Message-ID: <20190618135921.GA30776@x230>
References: <20190613161414.29161-1-pvorel@suse.cz>
 <20190613161414.29161-5-pvorel@suse.cz>
 <55f6fec4-ef01-db2b-62c0-cbbbf79c6c12@suse.de>
 <20190614141449.GA24614@dell5510>
 <794ee977-463f-6670-fac6-3e27e25d64ab@suse.de>
 <20190614144611.GA869@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614144611.GA869@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: linux-integrity@vger.kernel.org, ltp@lists.linux.it,
 Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [LTP] [PATCH v4 4/4] ima: Add overlay test + doc
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

SGkgTWltaSwgSWduYXosCgo+ID4gPiA+IFRoaXMgdGVzdCByZXF1aXJlcyAiYXBwcmFpc2VfdGNi
IiAoInRjYiIgaXMgbm90IGVub3VnaCksIGFzIHRoZSBlcnJvcnMgb25seQo+ID4gPiA+IG9jY3Vy
IGR1cmluZyBhcHByYWlzYWwuCj4gPiA+IEFyZSB5b3Ugc3VyZT8gVGhpcyBpcyBhIG5vdGUgZm9y
IGltYV9tZWFzdXJlbWVudHMuc2ggdGVzdCAobm90IGZvciBldm1fb3ZlcmxheS5zaCkuCj4gPiA+
IEkgcmVxdWlyZSBpbWFfcG9saWN5PXRjYiBoZXJlLCBhY2NvcmRpbmcgdG8gTWltaSBbMV0KCj4g
PiBPaCwgc29ycnksIHlvdSBhcmUgY29ycmVjdCAtICJ0Y2IiIGlzIGNvcnJlY3QgaW4gdGhpcyBj
YXNlLiBJIGdvdCBjb25mdXNlZAo+ID4gYXMgdGhlIGRvY3VtZW50YXRpb24gaXMgaW5jbHVkZWQg
aW4gdGhlIG92ZXJsYXlmcyByZXByb2R1Y2VyIHBhdGNoLgo+IE1heWJlIEkgc2hvdWxkIHB1dCBp
dCBpbnRvIHNlcGFyYXRlIGNvbW1pdC4KV2hvbGUgcGF0Y2hzZXQgbWVyZ2VkLgoKVGhhbmtzIGEg
bG90IGJvdGggZm9yIHlvdXIgaGVscCEKCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
