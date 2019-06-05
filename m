Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D93A360B0
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 18:00:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 478EA3EA6A4
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 18:00:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7B7BF3EA65D
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 17:59:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6119C1401333
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 17:59:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A02ECAEA1
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 15:59:57 +0000 (UTC)
Date: Wed, 5 Jun 2019 17:59:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190605155958.GA22233@dell5510>
References: <20190605135641.1848-1-pvorel@suse.cz>
 <20190605153529.GA29218@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605153529.GA29218@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] README: Add note about testing with Travis CI
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

SGkgQ3lyaWwsCgo+IE1heWJlIHdlIHNob3VsZCBleHBsYWluIHdoeSB0aGlzIGlzIGEgZ29vZCBp
ZGVhLCBzb21ldGhpbmcgYXM6Cgo+IEl0J3MgYSBnb29kIGlkZWEgdG8gdGVzdCBwYXRjaGVzIG9u
IFRyYXZpcyBDSSBiZWZvcmUgcG9zdGluZyB0byBtYWlsaW5nCj4gbGlzdC4gT3VyIHRyYXZpcyBz
ZXR1cCBjb3ZlcnMgdmFyaW91cyBhcmNoaXRlY3R1cmVzIGFuZCBkaXN0cmlidXRpb25zIGluCj4g
b3JkZXIgdG8gbWFrZSBzdXJlIExUUCBjb21waWxlcyBjbGVhbmx5IG9uIG1vc3QgY29tbW9uIGNv
bmZpZ3VyYXRpb25zLgpUaGFua3MsIGdvb2QgaWRlYS4gQWNraW5nIHRoaXM/CgorCitJdCdzIGEg
Z29vZCBpZGVhIHRvIHRlc3QgcGF0Y2hlcyBvbiBUcmF2aXMgQ0kgYmVmb3JlIHBvc3RpbmcgdG8g
bWFpbGluZworbGlzdC4gT3VyIHRyYXZpcyBzZXR1cCBjb3ZlcnMgdmFyaW91cyBhcmNoaXRlY3R1
cmVzIGFuZCBkaXN0cmlidXRpb25zIGluCitvcmRlciB0byBtYWtlIHN1cmUgTFRQIGNvbXBpbGVz
IGNsZWFubHkgb24gbW9zdCBjb21tb24gY29uZmlndXJhdGlvbnMuCitGb3IgdGVzdGluZyB5b3Ug
bmVlZCB0byBzaWduIHVwIHRvIFRyYXZpcyBDSSwgZW5hYmxlIHJ1bm5pbmcgYnVpbGRzIG9uIHlv
dXIgTFRQIGZvcmsgb24KK2h0dHBzOi8vdHJhdmlzLWNpLm9yZy9hY2NvdW50L3JlcG9zaXRvcmll
cyBhbmQgcHVzaCB5b3VyIGJyYW5jaC4KCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
