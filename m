Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3174615D
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 16:46:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A45463EA6A4
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 16:46:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2A7563EA58E
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 16:46:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 434D7602393
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 16:46:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 950A7AF99;
 Fri, 14 Jun 2019 14:46:16 +0000 (UTC)
Date: Fri, 14 Jun 2019 16:46:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ignaz Forster <iforster@suse.de>
Message-ID: <20190614144611.GA869@dell5510>
References: <20190613161414.29161-1-pvorel@suse.cz>
 <20190613161414.29161-5-pvorel@suse.cz>
 <55f6fec4-ef01-db2b-62c0-cbbbf79c6c12@suse.de>
 <20190614141449.GA24614@dell5510>
 <794ee977-463f-6670-fac6-3e27e25d64ab@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <794ee977-463f-6670-fac6-3e27e25d64ab@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 ltp@lists.linux.it
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

SGkgSWduYXosCgo+ID4gPiBUaGlzIHRlc3QgcmVxdWlyZXMgImFwcHJhaXNlX3RjYiIgKCJ0Y2Ii
IGlzIG5vdCBlbm91Z2gpLCBhcyB0aGUgZXJyb3JzIG9ubHkKPiA+ID4gb2NjdXIgZHVyaW5nIGFw
cHJhaXNhbC4KPiA+IEFyZSB5b3Ugc3VyZT8gVGhpcyBpcyBhIG5vdGUgZm9yIGltYV9tZWFzdXJl
bWVudHMuc2ggdGVzdCAobm90IGZvciBldm1fb3ZlcmxheS5zaCkuCj4gPiBJIHJlcXVpcmUgaW1h
X3BvbGljeT10Y2IgaGVyZSwgYWNjb3JkaW5nIHRvIE1pbWkgWzFdCgo+IE9oLCBzb3JyeSwgeW91
IGFyZSBjb3JyZWN0IC0gInRjYiIgaXMgY29ycmVjdCBpbiB0aGlzIGNhc2UuIEkgZ290IGNvbmZ1
c2VkCj4gYXMgdGhlIGRvY3VtZW50YXRpb24gaXMgaW5jbHVkZWQgaW4gdGhlIG92ZXJsYXlmcyBy
ZXByb2R1Y2VyIHBhdGNoLgpNYXliZSBJIHNob3VsZCBwdXQgaXQgaW50byBzZXBhcmF0ZSBjb21t
aXQuCgo+IElnbmF6CgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
