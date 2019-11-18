Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F2EFFE7C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:24:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D44313C2351
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:24:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 68C673C17C7
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:24:36 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 42B78600E3F
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:24:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 754DBB158;
 Mon, 18 Nov 2019 06:24:35 +0000 (UTC)
Date: Mon, 18 Nov 2019 07:24:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "Xu, Yang" <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191118062434.GA22527@x230>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572612959-20577-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191115164844.GA22234@x230>
 <05d48a2311e249e1b39f63b4869c90e8@G08CNEXMBPEKD04.g08.fujitsu.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05d48a2311e249e1b39f63b4869c90e8@G08CNEXMBPEKD04.g08.fujitsu.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
 test
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWHUsCgo+IEhpIFBldHIKPiAgSSB3aWxsIGNoZWNrIGl0IGFuZCBjb3JyZWN0IHRoZW0uCk5v
IG5lZWQgdG8gc2VuZCBhIG5ldyBwYXRjaHNldCBqdXN0IGZvciB0aGlzLCBJJ2xsIGZpeCB0aGF0
IGR1cmluZyBtZXJnZS4KCj4gPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS81XSBzeXNjYWxscy9x
dW90YWN0bDAxLmM6IEFkZCBRX0dFVE5FWFFVT1RBIHRlc3QKCj4gPlN1YmplY3Q6IFtQQVRDSCB2
MyAxLzVdIHN5c2NhbGxzL3F1b3RhY3RsMDEuYzogQWRkIFFfR0VUTkVYUVVPVEEgdGVzdCA9PiBz
L1FfR0VUTkVYUVVPVEEvUV9HRVRORVhUUVVPVEEvIDopIEdlbmVyYWxseSB0aGVyZSBhcmUgbW9y
ZSB0eXBvcyBpbiBkb2NzIGFuZCA+Zm9ybWF0dGluZyDjgItpc3N1ZXMuIEFzIHRoZXNlIGFyZSBq
dXN0IGEgc21hbGwgZGV0YWlscywgSSB1c3VhbGx5IGZpeCB0aGVtIGR1cmluZyBtZXJnZSwgYnV0
IGNvcHkgcGFzdGUgb24gY29uc3RhbnRzIGlzIHlvdSBmcmllbmQuCgpLaW5kIHJlZ2FyZHMsClBl
dHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
