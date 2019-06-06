Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 032F637584
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 15:43:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBB203EAA0F
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 15:43:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B22413EA2DC
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 15:43:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EB1A4100064C
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 15:43:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D2598AEBF
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 13:43:21 +0000 (UTC)
Date: Thu, 6 Jun 2019 15:43:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190606134321.GA30964@rei.lan>
References: <7b0b763f-0b6b-fb18-7916-d25afdcb5c68@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b0b763f-0b6b-fb18-7916-d25afdcb5c68@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] TST_GET_UNUSED_PORT returns ports < 1024
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

SGkhCj4gd2hlbiB1c2luZyB0aGUgVFNUX0dFVF9VTlVTRURfUE9SVCBtYWNybyB5b3Ugc29tZXRp
bWVzIGdldCBwb3J0cyBsb3dlcgo+IHRoYW4gMTAyNCB3aGljaCB3b3VsZCByZXF1aXJlIGEgdGVz
dGNhc2UgdG8gaGF2ZSB0aGUKPiBDQVBfTkVUX0JJTkRfU0VSVklDRSBjYXBhYmlsaXR5IChvciBz
aW1wbHkgcnVuIGFzIHJvb3QpLgoKTG9va2luZyBhdCB0aGUgY29kZSBhcyBmYXIgYXMgSSBjYW4g
dGVsbCB0aGUgZnVuY3Rpb24gcmV0dXJucyB0aGUgcG9ydAppbiB0aGUgbmV0d29yayBlbmRpYW5p
dHksIHdoaWNoIGlzIGJpZyBlbmRpYW4uIEludGVsIENQVXMgYXJlIGxpdHRsZQplbmRpYW4sIHNv
IGlmIHlvdSB3YW50IHRvIHByaW50IHRoZSBwb3J0IHlvdSBhY3R1YWxseSBoYXZlIHRvIHVzZQpu
dG9ocygpIGZ1bmN0aW9uIHRvIGNvbnZlcnQgaXQgdG8gdGhlIGhvc3QgZW5kaWFuaXR5LiBBbmQg
aWYgeW91IGFyZQpwYXNzaW5nIHRoYXQgdmFsdWUgaW4gdGhlIHNvY2thZGRyX2luIHN0cnVjdHVy
ZSB5b3UgbXVzdCBub3QgdXNlIHRoZQpodG9ucygpIHNpbmNlIHRoZSB2YWx1ZSBpcyBhbHJlYWR5
IGluIHRoZSBjb3JyZWN0IGJ5dGUgb3JkZXIuIEFuZCB5ZXMKdGhpcyBpcyBob3JyaWJseSBjb25m
dXNpbmcsIGJ1dCB0aGF0J3MgaG93IGl0IGlzLgoKSSBndWVzcyB0aGF0IHdlIHNob3VsZCB3cml0
ZSBkb3duIHRoaXMgcGllY2Ugb2YgaW5mb3JtYXRpb24gaW4gdGhlCmRvY3VtZW50YXRpb24sIGJl
Y2F1c2UgaXQgbG9va3MgbGlrZSB0aGUgdHN0X2dldF91bnVzZWRfcG9ydCBzaGVsbApoZWxwZXIg
ZG9lcyB0aGlzIGluY29ycmVjdGx5IGFuZCBwcmludHMgdGhlIHJhdyB2YWx1ZSBpbnN0ZWFkIG9m
CmNvbnZlcnRpbmcgaXQgd2l0aCBudG9ocygpLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1
c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
