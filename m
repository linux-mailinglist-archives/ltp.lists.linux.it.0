Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA0339CAC7
	for <lists+linux-ltp@lfdr.de>; Sat,  5 Jun 2021 21:44:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 470273C56A2
	for <lists+linux-ltp@lfdr.de>; Sat,  5 Jun 2021 21:44:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C72C73C2906
 for <ltp@lists.linux.it>; Sat,  5 Jun 2021 21:44:36 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 458C120099A
 for <ltp@lists.linux.it>; Sat,  5 Jun 2021 21:44:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF1A921A3D;
 Sat,  5 Jun 2021 19:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622922274;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWXGmDJ37a55prjqBhJxToyunNfViBUF6Y0PIHfBL0s=;
 b=3KyQstea+o+V3b8JsYjmGMLSRxI07r6BlZg94wOa8/71o5biERY6ju1rTzqzmUiiAEPFSm
 tkY0ORgEnCdE2GuycDdWvyzGDTAl8nAL2gnDJEh4W6DfAd/prLDmxsDxEBoXF2ta/1/y4X
 QWSD2FXR5hhlqwMXGk+ZylDo7h7v478=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622922274;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWXGmDJ37a55prjqBhJxToyunNfViBUF6Y0PIHfBL0s=;
 b=qShS2MhNcBueVYS//lRqGeq5J+F0xlvWOpNLeN3N8OJU/vSrhkhvFWMMjVLaCqVjejxHlG
 tB7C0cmUH1FwQtBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6A217118DD;
 Sat,  5 Jun 2021 19:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622922274;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWXGmDJ37a55prjqBhJxToyunNfViBUF6Y0PIHfBL0s=;
 b=3KyQstea+o+V3b8JsYjmGMLSRxI07r6BlZg94wOa8/71o5biERY6ju1rTzqzmUiiAEPFSm
 tkY0ORgEnCdE2GuycDdWvyzGDTAl8nAL2gnDJEh4W6DfAd/prLDmxsDxEBoXF2ta/1/y4X
 QWSD2FXR5hhlqwMXGk+ZylDo7h7v478=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622922274;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWXGmDJ37a55prjqBhJxToyunNfViBUF6Y0PIHfBL0s=;
 b=qShS2MhNcBueVYS//lRqGeq5J+F0xlvWOpNLeN3N8OJU/vSrhkhvFWMMjVLaCqVjejxHlG
 tB7C0cmUH1FwQtBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id feYpGCLUu2CBNgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Sat, 05 Jun 2021 19:44:34 +0000
Date: Sat, 5 Jun 2021 21:44:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Enji Cooper <yaneurabeya@gmail.com>
Message-ID: <YLvUIS44k/osj3Eo@pevik>
References: <YLh9jvI/p/VxsSmx@pevik>
 <CAASaF6yHHty1m+1U-buHUt4P80fnoTqXTaSO7G-YBm=REWZyWw@mail.gmail.com>
 <656D3EBA-5A3C-45F5-84B0-1427CE69C1F2@gmail.com>
 <YLqEGb/fWiGJDI6z@pevik>
 <2049AE25-BA87-4E1E-8429-E6506107B8F7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2049AE25-BA87-4E1E-8429-E6506107B8F7@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Remove disktest from LTP
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
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 automated-testing <automated-testing@yoctoproject.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cj4gPiBPbiBKdW4gNCwgMjAyMSwgYXQgMTI6NTAgUE0sIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToKCj4gPiBIaSBFbmppLAoKPiA+Pj4gZG9lcyBhbnlib2R5IHVzZSB0ZXN0Y2Fz
ZXMva2VybmVsL2lvL2Rpc2t0ZXN0ID8KCj4gPj4+IEl0IHN1cHBvcnRzIHZhcmlvdXMgT1MsIGJ1
dCBub3Qgc3VyZSBpZiBpdCdzIHJlbGV2YW50IG5vdyBpbiBTU0QgZXJhLgo+ID4+PiBMYXN0IHVw
ZGF0ZSB3YXMgaW4gMjAwOCAodmVyc2lvbiAxLjQuMikuCgo+ID4+PiBJIGRvbid0IHRoaW5rIEkg
ZXZlciB1c2VkIGl0LCBpdCBkb2VzIGxvb2sgb3V0ZGF0ZWQsIHNvIEkgd29uJ3QgbWlzcyBpdC4K
PiA+Pj4gSWYgaXQgaGFzIHVwc3RyZWFtIHJlcG8gc29tZXdoZXJlLCB3ZSBjb3VsZCBwdXQgYSBy
ZWZlcmVuY2UgaW4gY29tbWl0IG1lc3NhZ2UuCgo+ID4+IEkgc2F5IG51a2UgaXQgZnJvbSBvcmJp
dC4KCj4gPj4gSXQgZXhpc3RzIGluIFZDUyBzdGlsbCwgc28gaWYgc29tZW9uZSB3YW50cyB0byBy
ZXN0b3JlIGl0IGFuZCB3b3JrIG9uIGl0LCB0aGV5IGNhbiBnbyBiYWNrIHRocm91Z2ggdGhlIGdp
dCBoaXN0b3J5IGFuZCBkbyBzby4KCj4gPiBJIGhhdmUgbm90IGZvdW5kIHRoZSBvcmlnaW5hbCBw
cm9qZWN0IGluIHNvdXJjZWZvcmdlLiBXb3VsZCB5b3UgcGxlYXNlIHBvc3QgYQo+ID4gbGluaywg
SSdsbCBhZGQgaXQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIG9mIHRoZSByZW1vdmFsIGNvbW1pdC4K
Cj4gSSBob25lc3RseSBkb27igJl0IGtub3cgd2hlcmUgaXQgY2FtZSBmcm9tIDov4oCmClJpZ2h0
LCBucC4KCj4gTXkgY29tbWVudCB3YXMgbW9yZSB0aGUgZmFjdCB0aGF0IGl0IGV4aXN0cyBpbiB0
aGUgTFRQIGdpdGh1YiByZXBvLCB3aGljaCBtZWFucyAoZXZlbiBhZnRlciBpdOKAmXMgZGVsZXRl
ZCksIGl0IGNhbiBiZSByZXN0b3JlZC4KU3VyZS4KCj4gQ2hlZXJzLAo+IC1FbmppCgoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
