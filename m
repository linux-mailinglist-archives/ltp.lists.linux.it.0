Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E193689F04D
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Apr 2024 13:00:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F0F13CF778
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Apr 2024 13:00:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B9503CF73A
 for <ltp@lists.linux.it>; Wed, 10 Apr 2024 13:00:39 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=akumar@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5FE541400072
 for <ltp@lists.linux.it>; Wed, 10 Apr 2024 13:00:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A70C5CB30;
 Wed, 10 Apr 2024 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712746836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oe5te5o6a8OYiiw5QtWFx4Cz61UgrncP6NWIlEF3lwE=;
 b=VfnWQynLKj/yV1xBi3fwdVBtUANmMVxzyhOIFPLK3pKuEViuTK8skW/H1GES6r9+VFQ73y
 17FJ2W/aS2xKa0XSZ0fOC7oVJ7qeBHKjhV/T3TAKrdWO56XKXFiUoruRxj7CGu/z83obRp
 H1C8e2KC3myI0cHjOM4u4TG0veM7xDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712746836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oe5te5o6a8OYiiw5QtWFx4Cz61UgrncP6NWIlEF3lwE=;
 b=BVuhD0R8DgYIy8WYD8OJ711J1zYJ35x60+duIi+urVD1cyoTBhBfFElzCDKVACDW4nHjxH
 FVQcTSLJtIGRDOAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="EONB/KHC";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=n8LxrHTb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712746835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oe5te5o6a8OYiiw5QtWFx4Cz61UgrncP6NWIlEF3lwE=;
 b=EONB/KHCgiOgqXr28LUICwuxbPtmOsnUUh9nlcByjs3Hw2iPM9IAwoTkugxJ5c+MYhEeMp
 KZ4JeljFGawy8MJrl3LKgndXKZhF4yIjHeIOrAK3xAEK5lM8xZr6CRK3dyva7DPrJQdcdL
 ZEWFrygPd4HhtqZyTA1vIENaWCrDTjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712746835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oe5te5o6a8OYiiw5QtWFx4Cz61UgrncP6NWIlEF3lwE=;
 b=n8LxrHTbFKG00G3SJ7hX6EC1wBiAzhG9QcqNWXDRUUwmiHNGm7zFf6rsaxQr9/X+Pbndn2
 pAFI89nZwzILybAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A8CE13942;
 Wed, 10 Apr 2024 11:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Vt4mHVNxFmZ4ZQAAD6G6ig
 (envelope-from <akumar@suse.de>); Wed, 10 Apr 2024 11:00:35 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Date: Wed, 10 Apr 2024 13:00:34 +0200
Message-ID: <2653951.fDdHjke4Dd@localhost>
Organization: SUSE
In-Reply-To: <20240401025249.8715-1-xuyang2018.jy@fujitsu.com>
References: <20240401025249.8715-1-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 HAS_ORG_HEADER(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,fujitsu.com:email];
 TO_DN_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 8A70C5CB30
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -5.01
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] unlinkat: Add negative tests for unlinkat
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWFuZyBYdSwKUGxlYXNlIHNlZSBjb21tZW50cyBiZWxvdwoKT24gTW9uZGF5LCBBcHJpbCAx
LCAyMDI0IDQ6NTI6NDnigK9BTSBDRVNUIFlhbmcgWHUgdmlhIGx0cCB3cm90ZToKPiBBZGQgbmVn
YXRpdmUgY2FzZXMgZm9yIHVubGluaygpLCBpbmNsdWRpbmcgZm9sbG93aW5nIGVycm5vczoKPiBF
QUNDRVMsIEVGQVVMVCwgRUlTRElSLCBFTkFNRVRPT0xPTkcgRU5PRU5ULCBFTk9URElSLCBFUEVS
TSwgRVJPRlMsIEVCQURGLAo+IEVJTlZBTAo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWHUgPHh1
eWFuZzIwMTguanlAZnVqaXRzdS5jb20+Cj4gLS0tCj4gIHJ1bnRlc3Qvc3lzY2FsbHMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvdW5saW5rYXQvLmdpdGlnbm9yZSB8ICAgMSArCj4gIC4uLi9rZXJuZWwvc3lzY2FsbHMvdW5s
aW5rYXQvdW5saW5rYXQwMi5jICAgICB8IDIwMiArKysrKysrKysrKysrKysrKysKPiAgMyBmaWxl
cyBjaGFuZ2VkLCAyMDQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy91bmxpbmthdC91bmxpbmthdDAyLmMKPiAKPiBkaWZmIC0tZ2l0
IGEvcnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qvc3lzY2FsbHMKPiBpbmRleCBiOTljZTcxNzAu
LmVkNWVhYjFhOSAxMDA2NDQKPiAtLS0gYS9ydW50ZXN0L3N5c2NhbGxzCj4gKysrIGIvcnVudGVz
dC9zeXNjYWxscwo+IEBAIC0xNjU1LDYgKzE2NTUsNyBAQCB1bmxpbmswOSB1bmxpbmswOQo+IAo+
ICAjdW5saW5rYXQgdGVzdCBjYXNlcwo+ICB1bmxpbmthdDAxIHVubGlua2F0MDEKPiArdW5saW5r
YXQwMiB1bmxpbmthdDAyCj4gCj4gIHVuc2hhcmUwMSB1bnNoYXJlMDEKPiAgdW5zaGFyZTAyIHVu
c2hhcmUwMgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3VubGlua2F0
Ly5naXRpZ25vcmUKPiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdW5saW5rYXQvLmdpdGln
bm9yZSBpbmRleCA3NmVkNTUxZjIuLjQ1MDA2MzA1MQo+IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvdW5saW5rYXQvLmdpdGlnbm9yZQo+ICsrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvdW5saW5rYXQvLmdpdGlnbm9yZQo+IEBAIC0xICsxLDIgQEAKPiAgL3Vu
bGlua2F0MDEKPiArL3VubGlua2F0MDIKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy91bmxpbmthdC91bmxpbmthdDAyLmMKPiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvdW5saW5rYXQvdW5saW5rYXQwMi5jIG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwLi44N2U2ZGM3MDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy91bmxpbmthdC91bmxpbmthdDAyLmMKPiBAQCAtMCwwICsxLDIwMiBAQAo+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ICsvKgo+ICsgKiBD
b3B5cmlnaHQgKGMpIDIwMjQgRlVKSVRTVSBMSU1JVEVELiBBbGwgUmlnaHRzIFJlc2VydmVkLgo+
ICsgKiBBdXRob3I6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAZnVqaXRzdS5jb20+Cj4gKyAqLwo+
ICsKPiArLypcCj4gKyAqIFtEZXNjcmlwdGlvbl0KPiArICoKPiArICogVmVyaWZ5IHRoYXQgdW5s
aW5rYXQoMikgZmFpbHMgd2l0aAo+ICsgKgo+ICsgKiAtIEVBQ0NFUyB3aGVuIHdyaXRlIGFjY2Vz
cyB0byB0aGUgZGlyZWN0b3J5IGNvbnRhaW5pbmcgcGF0aG5hbWUgbm90Cj4gYWxsb3dlZCArICog
LSBFQUNDRVMgd2hlbiBvbmUgb2YgZGlyZWN0b3JpZXMgaW4gcGF0aG5hbWUgZGlkIG5vdCBhbGxv
dwo+IHNlYXJjaCBwZXJtaXNzaW9uICsgKiAtIEVGQVVMVCB3aGVuIHBhdGhuYW1lIHBvaW50cyBv
dXRzaWRlIGFjZXNzaWJsZQo+IGFkZHJlc3Mgc3BhY2UKPiArICogLSBFSVNESVIgd2hlbiBwYXRo
bmFtZSByZWZlcnMgdG8gYSBkaXJlY3RvcnkKPiArICogLSBFTkFNRVRPT0xPTkcgd2hlbiBwYXRo
bmFtZSBpcyB0b28gbG9uZwo+ICsgKiAtIEVOT0VOVCB3aGVuIGEgY29tcG9uZW50IG9mIHRoZSBw
YXRobmFtZSBkb2VzIG5vdCBleGlzdAo+ICsgKiAtIEVOT0VOVCB3aGVuIHBhdGhuYW1lIGlzIGVt
cHR5Cj4gKyAqIC0gRU5PVERJUiB3aGVuIGEgY29tcG9uZW50IG9mIHBhdGhuYW1lIHVzZWQgYXMg
ZGljcmVjdG9yeSBpcyBub3QgYQo+IGRpcmVjdG9yeSArICogLSBFUEVSTSB3aGVuIGZpbGUgdG8g
YmUgdW5saW5rZWQgaXMgbWFya2VkIGltbXV0YWJsZQo+ICsgKiAtIEVQRVJNIHdoZW4gZmlsZSB0
byBiZSB1bmxpbmtlZCBpcyBtYXJrZWQgYXBwZW5kLW9ubHkKPiArICogLSBFUk9GUyB3aGVuIHBh
dGhuYW1lIHJlZmVycyB0byBhIGZpbGUgb24gYSByZWFkLW9ubHkgZmlsZXN5c3RlbQo+ICsgKiAt
IEVCQURGIHdoZW4gcGF0aG5hbWUgaXMgcmVsYXRpdmUgYnV0IGRpcmZkIGlzIG5laXRoZXIgQVRf
RkRDV0Qgbm9yCj4gdmFsaWQgKyAqIC0gRUlOVkFMIHdoZW4gYW4gaW52YWxpZCBmbGFnIGlzIHNw
ZWNpZmllZAo+ICsgKiAtIEVOT1RESVIgd2hlbiBwYXRobmFtZSBpcyByZWxhdGl2ZSBhbmQgZGly
ZmQgcmVmZXJzIHRvIGEgZmlsZQo+ICsgKi8KPiArCj4gKyNkZWZpbmUgX0dOVV9TT1VSQ0UKPiAr
Cj4gKyNpbmNsdWRlIDxlcnJuby5oPgo+ICsjaW5jbHVkZSA8ZmNudGwuaD4KPiArI2luY2x1ZGUg
PHB3ZC5oPgo+ICsjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gKyNpbmNsdWRlIDxzeXMvaW9jdGwuaD4K
PiArI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gKyNpbmNsdWRlICJ0c3Rfc2FmZV9tYWNyb3MuaCIK
PiArI2luY2x1ZGUgImxhcGkvZnMuaCIKPiArCj4gKyNkZWZpbmUgRElSX0VBQ0NFU19OT1dSSVRF
ICJub3dyaXRlIgo+ICsjZGVmaW5lIERJUl9FQUNDRVNfTk9TRUFSQ0ggIm5vc2VhcmNoIgo+ICsj
ZGVmaW5lIFRFU1RfRUFDQ0VTICJ0ZXN0X2VhY2NlcyIKPiArI2RlZmluZSBESVJfTk9STUFMICJu
b3JtYWwiCj4gKyNkZWZpbmUgVEVTVF9OT1JNQUwgInRlc3Rfbm9ybWFsIgo+ICsjZGVmaW5lIFRF
U1RfRUZBVUxUICJ0ZXN0X2VmYXVsdCIKPiArI2RlZmluZSBESVJfRUlTRElSICJpc2RpciIKPiAr
I2RlZmluZSBURVNUX0VOT0VOVF9OT1RFWElTVCAidGVzdF9lbm9lbnRfbm90ZXhpc3QiCj4gKyNk
ZWZpbmUgVEVTVF9FTk9FTlRfRklMRSAidGVzdF9lbm9lbnRfZmlsZSIKPiArI2RlZmluZSBURVNU
X0VOT1RESVIgImVub3RkaXIvZmlsZSIKPiArI2RlZmluZSBESVJfRU5PVERJUiAiZW5vdGRpciIK
PiArI2RlZmluZSBURVNUX0VQRVJNX0lNTVVUQUJMRSAidGVzdF9lcGVybV9pbW11dGFibGUiCj4g
KyNkZWZpbmUgVEVTVF9FUEVSTV9BUFBFTkRfT05MWSAidGVzdF9lcGVybV9hcHBlbmRfb25seSIK
PiArI2RlZmluZSBESVJfRVJPRlMgImVyb2ZzIgo+ICsjZGVmaW5lIFRFU1RfRVJPRlMgInRlc3Rf
ZXJvZnMiCj4gKyNkZWZpbmUgRElSX0VCQURGICJlYmFkZiIKPiArI2RlZmluZSBURVNUX0VCQURG
ICJ0ZXN0X2ViYWRmIgo+ICsjZGVmaW5lIERJUl9FTk9URElSMiAiZW5vdGRpcjIiCj4gKyNkZWZp
bmUgVEVTVF9FTk9URElSMiAidGVzdF9lbm90ZGlyMiIKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgcGFz
c3dkICpwdzsKPiArc3RhdGljIGNoYXIgbG9uZ2ZpbGVuYW1lW1BBVEhfTUFYICsgMV07Cj4gK3N0
YXRpYyBpbnQgZmRfaW1tdXRhYmxlOwo+ICtzdGF0aWMgaW50IGZkX2FwcGVuZF9vbmx5Owo+ICsK
PiArc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2VfdCB7Cj4gKwljaGFyICpkaXJuYW1lOwo+ICsJY2hh
ciAqZmlsZW5hbWU7Cj4gKwlpbnQgZmxhZ3M7Cj4gKwlpbnQgdXNlcjsKPiArCWludCBleHBlY3Rl
ZF9lcnJubzsKPiArCWNoYXIgKmRlc2M7Cj4gK30gdGNhc2VzW10gPSB7Cj4gKwl7RElSX0VBQ0NF
U19OT1dSSVRFLCBURVNUX0VBQ0NFUywgMCwgMSwgRUFDQ0VTLAo+ICsJCSJ1bmxpbmthdCgpIGlu
IGRpcmVjdG9yeSB3aXRoIG5vIHdyaXRlIGFjY2VzcyJ9LAo+ICsJe0RJUl9FQUNDRVNfTk9TRUFS
Q0gsIFRFU1RfRUFDQ0VTLCAwLCAxLCBFQUNDRVMsCj4gKwkJInVubGlua2F0KCkgaW4gZGlyZWN0
b3J5IHdpdGggbm8gc2VhcmNoIGFjY2VzcyJ9LAo+ICsJe0RJUl9OT1JNQUwsIE5VTEwsIDAsIDAs
IEVGQVVMVCwKPiArCQkidW5saW5rYXQoKSBhY2Nlc3MgcGF0aG5hbWUgb3V0c2lkZSBhZGRyZXNz
IHNwYWNlIn0sCj4gKwl7RElSX05PUk1BTCwgRElSX0VJU0RJUiwgMCwgMCwgRUlTRElSLAo+ICsJ
CSJ1bmxpbmthdCgpIHBhdGhuYW1lIGlzIGEgZGlyZWN0b3J5In0sCj4gKwl7RElSX05PUk1BTCwg
bG9uZ2ZpbGVuYW1lLCAwLCAwLCBFTkFNRVRPT0xPTkcsCj4gKwkJInVubGlua2F0KCkgcGF0aG5h
bWUgaXMgdG9vIGxvbmcifSwKPiArCXtESVJfTk9STUFMLCBURVNUX0VOT0VOVF9OT1RFWElTVCwg
MCwgMCwgRU5PRU5ULAo+ICsJCSJ1bmxpbmthdCgpIHBhdGhuYW1lIGRvZXMgbm90IGV4aXN0In0s
Cj4gKwl7RElSX05PUk1BTCwgIiIsIDAsIDAsIEVOT0VOVCwKPiArCQkidW5saW5rYXQoKSBwYXRo
bmFtZSBpcyBhIGVtcHR5In0sCj4gKwl7RElSX05PUk1BTCwgVEVTVF9FTk9URElSLCAwLCAwLCBF
Tk9URElSLAo+ICsJCSJ1bmxpbmthdCgpIGNvbXBvbmVudCBvZiBwYXRobmFtZSB1c2VkIGFzIGRp
cmVjdG9yeSAiCj4gKwkJImlzIG5vdCBkaXJlY3RvcnkifSwKPiArCXtESVJfTk9STUFMLCBURVNU
X0VQRVJNX0lNTVVUQUJMRSwgMCwgMCwgRVBFUk0sCj4gKwkJInVubGlua2F0KCkgcGF0aG5hbWUg
aXMgaW1tdXRhYmxlIn0sCj4gKwl7RElSX05PUk1BTCwgVEVTVF9FUEVSTV9BUFBFTkRfT05MWSwg
MCwgMCwgRVBFUk0sCj4gKwkJInVubGlua2F0KCkgcGF0aG5hbWUgaXMgYXBwZW5kLW9ubHkifSwK
PiArCXtESVJfRVJPRlMsIFRFU1RfRVJPRlMsIDAsIDAsIEVST0ZTLAo+ICsJCSJ1bmxpbmthdCgp
IHBhdGhuYW1lIGluIHJlYWQtb25seSBmaWxlc3lzdGVtIn0sCj4gKwl7RElSX0VCQURGLCBURVNU
X0VCQURGLCAwLCAwLCBFQkFERiwKPiArCQkidW5saW5rYXQoKSBkaXJmZCBpcyBub3QgdmFsaWQi
fSwKPiArCXtESVJfTk9STUFMLCBURVNUX05PUk1BTCwgLTEsIDAsIEVJTlZBTCwKPiArCQkidW5s
aW5rYXQoKSBmbGFnIGlzIG5vdCB2YWxpZCJ9LAo+ICsJe0RJUl9FTk9URElSMiwgVEVTVF9FTk9U
RElSMiwgMCwgMCwgRU5PVERJUiwKPiArCQkidW5saW5rYXQoKSBkaXJmZCBpcyBub3QgYSBkaXJl
Y3RvcnkifSwKPiArfTsKPiArCj4gK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gK3sKPiArCWlu
dCBhdHRyOwo+ICsKPiArCXB3ID0gU0FGRV9HRVRQV05BTSgibm9ib2R5Iik7Cj4gKwo+ICsJU0FG
RV9NS0RJUihESVJfRUFDQ0VTX05PV1JJVEUsIDA3NzcpOwpJIGFtIG5vdCBzdXJlIGlmIHdlIG5l
ZWQgdG8gY29uc2lkZXIgc2V0dGluZyB0aGUgdW1hc2sgdG8gMCBiZWZvcmUgY3JlYXRpbmcKdGhl
IHRlc3QgZGlyZWN0b3JpZXMsIHdpdGhvdXQgdGhhdCBkaXJlY3RvcmllcyB3aWxsIG5vdCBoYXZl
IHRoZSBtb2RlIGJpdHMgYXMKcmVxdWVzdGVkLgo+ICsJU0FGRV9UT1VDSChESVJfRUFDQ0VTX05P
V1JJVEUgIi8iIFRFU1RfRUFDQ0VTLCAwNzc3LCBOVUxMKTsKPiArCVNBRkVfQ0hNT0QoRElSX0VB
Q0NFU19OT1dSSVRFLCAwNTU1KTsKPiArCj4gKwlTQUZFX01LRElSKERJUl9FQUNDRVNfTk9TRUFS
Q0gsIDA3NzcpOwo+ICsJU0FGRV9UT1VDSChESVJfRUFDQ0VTX05PU0VBUkNIICIvIiBURVNUX0VB
Q0NFUywgMDc3NywgTlVMTCk7Cj4gKwlTQUZFX0NITU9EKERJUl9FQUNDRVNfTk9TRUFSQ0gsIDA2
NjYpOwo+ICsKPiArCVNBRkVfTUtESVIoRElSX05PUk1BTCwgMDc3Nyk7Cj4gKwlTQUZFX1RPVUNI
KERJUl9OT1JNQUwgIi8iIFRFU1RfTk9STUFMLCAwNzc3LCBOVUxMKTsKPiArCVNBRkVfVE9VQ0go
RElSX05PUk1BTCAiLyIgVEVTVF9FRkFVTFQsIDA3NzcsIE5VTEwpOwo+ICsKPiArCVNBRkVfTUtE
SVIoRElSX05PUk1BTCAiLyIgRElSX0VJU0RJUiwgMDc3Nyk7Cj4gKwo+ICsJbWVtc2V0KGxvbmdm
aWxlbmFtZSwgJzEnLCBQQVRIX01BWCArIDEpOwo+ICsKPiArCVNBRkVfVE9VQ0goRElSX05PUk1B
TCAiLyIgRElSX0VOT1RESVIsIDA3NzcsIE5VTEwpOwo+ICsKPiArCWZkX2ltbXV0YWJsZSA9IFNB
RkVfT1BFTihESVJfTk9STUFMICIvIiBURVNUX0VQRVJNX0lNTVVUQUJMRSwKPiArCQkJT19DUkVB
VCwgMDc3Nyk7Cj4gKwlpb2N0bChmZF9pbW11dGFibGUsIEZTX0lPQ19HRVRGTEFHUywgJmF0dHIp
Owo+ICsJYXR0ciB8PSBGU19JTU1VVEFCTEVfRkw7Cj4gKwlpb2N0bChmZF9pbW11dGFibGUsIEZT
X0lPQ19TRVRGTEFHUywgJmF0dHIpOwo+ICsJU0FGRV9DTE9TRShmZF9pbW11dGFibGUpOwo+ICsK
PiArCWZkX2FwcGVuZF9vbmx5ID0gU0FGRV9PUEVOKERJUl9OT1JNQUwgIi8iIFRFU1RfRVBFUk1f
QVBQRU5EX09OTFksCj4gKwkJCU9fQ1JFQVQsIDA3NzcpOwo+ICsJaW9jdGwoZmRfYXBwZW5kX29u
bHksIEZTX0lPQ19HRVRGTEFHUywgJmF0dHIpOwo+ICsJYXR0ciB8PSBGU19JTU1VVEFCTEVfRkw7
Cj4gKwlpb2N0bChmZF9hcHBlbmRfb25seSwgRlNfSU9DX1NFVEZMQUdTLCAmYXR0cik7Cj4gKwlT
QUZFX0NMT1NFKGZkX2FwcGVuZF9vbmx5KTsKPiArCj4gKwlTQUZFX1RPVUNIKERJUl9FTk9URElS
MiwgMDc3NywgTlVMTCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKPiAr
ewo+ICsJaW50IGF0dHI7Cj4gKwo+ICsJZmRfaW1tdXRhYmxlID0gU0FGRV9PUEVOKERJUl9OT1JN
QUwgIi8iIFRFU1RfRVBFUk1fSU1NVVRBQkxFLAo+ICsJCQlPX1JET05MWSwgMDc3Nyk7Cj4gKwlp
b2N0bChmZF9pbW11dGFibGUsIEZTX0lPQ19HRVRGTEFHUywgJmF0dHIpOwo+ICsJYXR0ciAmPSB+
RlNfSU1NVVRBQkxFX0ZMOwo+ICsJaW9jdGwoZmRfaW1tdXRhYmxlLCBGU19JT0NfU0VURkxBR1Ms
ICZhdHRyKTsKPiArCVNBRkVfQ0xPU0UoZmRfaW1tdXRhYmxlKTsKPiArCj4gKwlmZF9hcHBlbmRf
b25seSA9IFNBRkVfT1BFTihESVJfTk9STUFMICIvIiBURVNUX0VQRVJNX0FQUEVORF9PTkxZLAo+
ICsJCQlPX1JET05MWSwgMDc3Nyk7Cj4gKwlpb2N0bChmZF9hcHBlbmRfb25seSwgRlNfSU9DX0dF
VEZMQUdTLCAmYXR0cik7Cj4gKwlhdHRyICY9IH5GU19JTU1VVEFCTEVfRkw7Cj4gKwlpb2N0bChm
ZF9hcHBlbmRfb25seSwgRlNfSU9DX1NFVEZMQUdTLCAmYXR0cik7Cj4gKwlTQUZFX0NMT1NFKGZk
X2FwcGVuZF9vbmx5KTsKCkFsbCB0aGUgcmVzdG9yaW5nIHNob3VsZCBub3QgYmUgcGFydCBvZiBj
bGVhbnVwLCBpbnN0ZWFkIGl0IG11c3QgYmUgaGFuZGxlZAppbiB0aGUgbWFpbiB0ZXN0IGZ1bmN0
aW9uLiBzZXR1cCgpIGFuZCBjbGVhbnVwKCkgaXMgY2FsbGVkIGp1c3Qgb25jZS4KU28gaWYgc29t
ZWhvdyB1bmxpbmthdCgpIGNhbGwgZG9lc24ndCBmYWlsLCBhbGwgdGhlIGZ1cnRoZXIgaXRlcmF0
aW9ucyB3aWxsCmJlIGJyb2tlbi4KCj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGRvX3VubGlua2F0
KHN0cnVjdCB0ZXN0X2Nhc2VfdCAqdGMpCj4gK3sKPiArCWludCBkaXJmZCA9IG9wZW4odGMtPmRp
cm5hbWUsIE9fRElSRUNUT1JZKTsKPiArCS8qIFNwZWNpYWwgc2l0dWF0aW9uIHdoZW4gZGlyZmQg
cmVmZXJzIHRvIGEgZmlsZSAqLwpJIHRoaW5rIHdlIHNob3VsZCBhbHNvIGNoZWNrIHRoZSBlcnJu
byA9PSBFTk9URElSIHRvIG1ha2Ugc3VyZSBvcGVuKCkKaXMgbm90IGZhaWxpbmcgZm9yIHNvbWUg
b3RoZXIgcmVhc29uLgo+ICsJaWYgKGRpcmZkIDwgMCkKPiArCQlkaXJmZCA9IG9wZW4odGMtPmRp
cm5hbWUsIE9fQVBQRU5EKTsKPiArCj4gKwlUU1RfRVhQX0ZBSUwodW5saW5rYXQoZGlyZmQsIHRj
LT5maWxlbmFtZSwgdGMtPmZsYWdzKSwKPiArCQl0Yy0+ZXhwZWN0ZWRfZXJybm8sCj4gKwkJIiVz
IiwgdGMtPmRlc2MpOwpkaXJmZCBuZWVkIHRvIGJlIGNsb3NlZCBhZnRlciBlYWNoIGl0ZXJhdGlv
biwgdGVzdHMgc3RhcnRzIGZhaWxpbmcgd2l0aCBFQkFERgp3aGVuIHdlIGV4aGF1c3QgdGhlIGxp
bWl0IGZvciBtYXggb3BlbiBmZHMsIHRyeSBydW5uaW5nIHdpdGggJy1pIDExMDAnIG9wdGlvbi4K
PiArfQo+ICsKPiArc3RhdGljIHZvaWQgdmVyaWZ5X3VubGlua2F0KHVuc2lnbmVkIGludCBpKQo+
ICt7Cj4gKwlzdHJ1Y3QgdGVzdF9jYXNlX3QgKnRjID0gJnRjYXNlc1tpXTsKPiArCXBpZF90IHBp
ZDsKPiArCj4gKwlpZiAodGMtPnVzZXIpIHsKPiArCQlwaWQgPSBTQUZFX0ZPUksoKTsKPiArCQlp
ZiAoIXBpZCkgewo+ICsJCQlTQUZFX1NFVFVJRChwdy0+cHdfdWlkKTsKPiArCQkJZG9fdW5saW5r
YXQodGMpOwo+ICsJCQlleGl0KDApOwo+ICsJCX0KPiArCQlTQUZFX1dBSVRQSUQocGlkLCBOVUxM
LCAwKTsKPiArCX0gZWxzZSB7Cj4gKwkJZG9fdW5saW5rYXQodGMpOwo+ICsJfQo+ICt9Cj4gKwo+
ICtzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gKwkuc2V0dXAgPSBzZXR1cCwKPiAr
CS50Y250ID0gQVJSQVlfU0laRSh0Y2FzZXMpLAo+ICsJLmNsZWFudXAgPSBjbGVhbnVwLAo+ICsJ
LnRlc3QgPSB2ZXJpZnlfdW5saW5rYXQsCj4gKwkubmVlZHNfcm9mcyA9IDEsCj4gKwkubW50cG9p
bnQgPSBESVJfRVJPRlMsCj4gKwkubmVlZHNfcm9vdCA9IDEsCj4gKwkuZm9ya3NfY2hpbGQgPSAx
LAo+ICt9OwoKClJlZ2FyZHMsCkF2aW5lc2gKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
