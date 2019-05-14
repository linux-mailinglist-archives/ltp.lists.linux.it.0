Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CCC1CA69
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 16:30:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B82C63EA37E
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 16:30:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 861F23EA1E6
 for <ltp@lists.linux.it>; Tue, 14 May 2019 16:30:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 81C151400DD2
 for <ltp@lists.linux.it>; Tue, 14 May 2019 16:30:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D20B9ADF1;
 Tue, 14 May 2019 14:30:46 +0000 (UTC)
Date: Tue, 14 May 2019 16:30:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Balamuruhan S <bala24@linux.vnet.ibm.com>
Message-ID: <20190514143045.GD1516@rei>
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190508084447.18191-2-liwang@redhat.com>
 <20190509064535.GA6096@dhcp-9-109-247-167.in.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509064535.GA6096@dhcp-9-109-247-167.in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] libltpnuma: remove restrictions on numa
 node-id
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

SGkhCj4gSXQgaXMgYmV0dGVyIHRvIGhhdmUgY2hlY2sgZm9yIHBvd2VycGMgYW5kIHJlbW92ZSBy
ZXN0cmljdGlvbiBhcyBpdCB3aWxsCj4gc3RpbGwgaG9sZCBnb29kIGZvciBvdGhlciBhcmNoLgoK
SSB3b3VsZCBsaWtlIHRvIGF2b2lkIGFkZGluZyBhcmNoIHNwZWNpZmljIGlmZGVmcyB0byB0aGUg
Y29kZSwgc28gZm9yCnRoZSByZWxlYXNlIEkndmUgY29tbWl0ZWQgdGhlIG9yaWdpbmFsIGZpeCBh
bmQgd2UgY2FuIGFkZCBiZXR0ZXIgY2hlY2tzCmxhdGVyIG9uLiBBcyBJIHdyb3RlIGNoZWNraW5n
IHRoYXQgdGhlIG51bWEgaWQgaXMgPD0gdGhhbiBtYXhpbWFsIHVzZWQKaWQgd291bGQgYmUgbXVj
aCBiZXR0ZXIgYW5kIHdvdWxkIHdvcmsgaW4gYWxsIGNhc2VzLgoKLS0gCkN5cmlsIEhydWJpcwpj
aHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
