Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CD23C36
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 17:34:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C84B2D0147
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 17:34:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A43872D013A
 for <ltp@lists.linux.it>; Mon, 20 May 2019 17:34:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 757B610005EF
 for <ltp@lists.linux.it>; Mon, 20 May 2019 17:34:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCA30AFE3;
 Mon, 20 May 2019 15:34:12 +0000 (UTC)
Date: Mon, 20 May 2019 17:34:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20190520153411.GA14132@dell5510>
References: <20190509164125.619-1-pvorel@suse.cz>
 <20190509164125.619-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509164125.619-2-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_net_vars.c: Enlarge buffer to fix format
 overflow warnings
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

SGksCgo+IHRzdF9uZXRfdmFycy5jOjIzMDoxODogd2FybmluZzog4oCYLjAuMOKAmSBkaXJlY3Rp
dmUgd3JpdGluZyA0IGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDEy
OCBbLVdmb3JtYXQtb3ZlcmZsb3c9XQo+ICAgc3ByaW50ZihidWYsICIlcy4wLjAiLCBuZXRfdW51
c2VkKTsKPiAgICAgICAgICAgICAgICAgICBefn5+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91
c3IvaW5jbHVkZS9zdGRpby5oOjg2NywKPiAgICAgICAgICAgICAgICAgIGZyb20gdHN0X25ldF92
YXJzLmM6MjY6Cj4gL3Vzci9pbmNsdWRlL2JpdHMvc3RkaW8yLmg6MzY6MTA6IG5vdGU6IOKAmF9f
YnVpbHRpbl9fX3NwcmludGZfY2hr4oCZIG91dHB1dCBiZXR3ZWVuIDUgYW5kIDEzMiBieXRlcyBp
bnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSAxMjgKCj4gdHN0X25ldF92YXJzLmM6Mjk0OjE4OiB3
YXJuaW5nOiDigJg6OuKAmSBkaXJlY3RpdmUgd3JpdGluZyAyIGJ5dGVzIGludG8gYSByZWdpb24g
b2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDEyOCBbLVdmb3JtYXQtb3ZlcmZsb3c9XQo+ICAgc3ByaW50
ZihidWYsICIlczo6IiwgbmV0X3VudXNlZCk7Cj4gICAgICAgICAgICAgICAgICAgXn4KPiBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gL3Vzci9pbmNsdWRlL3N0ZGlvLmg6ODY3LAo+ICAgICAgICAgICAg
ICAgICAgZnJvbSB0c3RfbmV0X3ZhcnMuYzoyNjoKPiAvdXNyL2luY2x1ZGUvYml0cy9zdGRpbzIu
aDozNjoxMDogbm90ZTog4oCYX19idWlsdGluX19fc3ByaW50Zl9jaGvigJkgb3V0cHV0IGJldHdl
ZW4gMyBhbmQgMTMwIGJ5dGVzIGludG8gYSBkZXN0aW5hdGlvbiBvZiBzaXplIDEyOAoKPiBGaXhl
czogZDE4ZTEzNWQwICgibmV0d29yazogQWRkIHRvb2xzIGZvciBzZXR1cCBJUCByZWxhdGVkIGVu
dmlyb25tZW50Cj4gdmFyaWFibGVzIikKCj4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZv
cmVsQHN1c2UuY3o+Cj4gLS0tCj4gIHRlc3RjYXNlcy9saWIvdHN0X25ldF92YXJzLmMgfCA0ICsr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkJv
dGggY29tbWl0cyBwdXNoZWQuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
