Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EdyLGmhpmlqRwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Mar 2026 09:52:57 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 516E21EB13E
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Mar 2026 09:52:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBCCD3D9EA0
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2026 09:52:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DCA213D9251
 for <ltp@lists.linux.it>; Tue,  3 Mar 2026 09:52:51 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6D7A8600952
 for <ltp@lists.linux.it>; Tue,  3 Mar 2026 09:52:51 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3EC75BDFA;
 Tue,  3 Mar 2026 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772527970;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwV/rk47DLHN/fPCuBfFzhTDMRhO+V/iRqbRZXIYSvA=;
 b=MJqTWKmNTfdq5GtFb5fsn4+TdW0lbiIyTiEgATWM3liv3Y7zOQvZB4l9oGxms+Gm8bdKhS
 OxdPLjIQufoODqQSckACbNiSDfdDywxp4GrMshWroUNvcZnaZZ9/N++iZXe3FIpVUTkzXW
 XzQ+XrYDTPYfVSCdJo2EpTDTiDZhaVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772527970;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwV/rk47DLHN/fPCuBfFzhTDMRhO+V/iRqbRZXIYSvA=;
 b=4dtFK4As/YCHt96WUO5zS/nGytG5wMEhdQ7KQsvwCPqzWsM+7JJ4yWirrStN9LlY9epZBH
 cisVjtSTyfS1iXAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772527970;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwV/rk47DLHN/fPCuBfFzhTDMRhO+V/iRqbRZXIYSvA=;
 b=MJqTWKmNTfdq5GtFb5fsn4+TdW0lbiIyTiEgATWM3liv3Y7zOQvZB4l9oGxms+Gm8bdKhS
 OxdPLjIQufoODqQSckACbNiSDfdDywxp4GrMshWroUNvcZnaZZ9/N++iZXe3FIpVUTkzXW
 XzQ+XrYDTPYfVSCdJo2EpTDTiDZhaVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772527970;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwV/rk47DLHN/fPCuBfFzhTDMRhO+V/iRqbRZXIYSvA=;
 b=4dtFK4As/YCHt96WUO5zS/nGytG5wMEhdQ7KQsvwCPqzWsM+7JJ4yWirrStN9LlY9epZBH
 cisVjtSTyfS1iXAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D10C53EA69;
 Tue,  3 Mar 2026 08:52:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nZopMmGhpmmrIwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 03 Mar 2026 08:52:49 +0000
Date: Tue, 3 Mar 2026 09:52:48 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20260303085248.GA301671@pevik>
References: <20260302144446.1291724-1-amir73il@gmail.com>
 <aaWvOIlfyIDH7J8A@yuki.lan>
 <CAOQ4uxhpcC76cpj21Dv-279FnVgHLSjCXmYKxu526jV-Uo7G_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhpcC76cpj21Dv-279FnVgHLSjCXmYKxu526jV-Uo7G_w@mail.gmail.com>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fanotify25: fix test failure on kernel with
 CONFIG_MODULES=n
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
Cc: ltp@lists.linux.it, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 516E21EB13E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	NEURAL_HAM(-0.00)[-0.705];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

PiBPbiBNb24sIE1hciAyLCAyMDI2IGF0IDQ6MznigK9QTSBDeXJpbCBIcnViaXMgPGNocnViaXNA
c3VzZS5jej4gd3JvdGU6Cgo+ID4gSGkhCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFtaXIgR29sZHN0
ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTI1LmMgfCA4ICsrKystLS0tCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKPiA+ID4gZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkyNS5jIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTI1LmMKPiA+ID4gaW5k
ZXggYzk4MmYzMjI1Li45YjAzZmQ5YWIgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkyNS5jCj4gPiA+ICsrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkyNS5jCj4gPiA+IEBAIC0yNCwxMCArMjQs
MTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB0cmFjZWNvbmZpZyB7Cj4gPiA+ICAgICAgIGNvbnN0
IGNoYXIgKmZpbGVuYW1lOwo+ID4gPiAgICAgICBjb25zdCBjaGFyICp3ZGF0YTsKPiA+ID4gIH0g
dHJhY2VfY21kc1tdID0gewo+ID4gPiAtICAgICB7RVZFTlRTX1NZU0ZJTEUsICJwOmx0cF9sb2Fk
X21vZHVsZV8wIGxvYWRfbW9kdWxlIn0sCj4gPiA+IC0gICAgIHtNTlRQT0lOVCAiL2V2ZW50cy9r
cHJvYmVzL2x0cF9sb2FkX21vZHVsZV8wL2VuYWJsZSIsICIxIn0sCj4gPiA+IC0gICAgIHtNTlRQ
T0lOVCAiL2V2ZW50cy9rcHJvYmVzL2x0cF9sb2FkX21vZHVsZV8wL2VuYWJsZSIsICIwIn0sCj4g
PiA+IC0gICAgIHtFVkVOVFNfU1lTRklMRSwgIi06bHRwX2xvYWRfbW9kdWxlXzAifSwKPiA+ID4g
KyAgICAge0VWRU5UU19TWVNGSUxFLCAicDpsdHBfbG9hZF9zY3JpcHRfMCBsb2FkX3NjcmlwdCJ9
LAo+ID4gPiArICAgICB7TU5UUE9JTlQgIi9ldmVudHMva3Byb2Jlcy9sdHBfbG9hZF9zY3JpcHRf
MC9lbmFibGUiLCAiMSJ9LAo+ID4gPiArICAgICB7TU5UUE9JTlQgIi9ldmVudHMva3Byb2Jlcy9s
dHBfbG9hZF9zY3JpcHRfMC9lbmFibGUiLCAiMCJ9LAo+ID4gPiArICAgICB7RVZFTlRTX1NZU0ZJ
TEUsICItOmx0cF9sb2FkX3NjcmlwdF8wIn0sCgo+ID4gRG9lc24ndCB0aGlzIGRlcGVuZCBvbiBD
T05GSUdfQklORk1UX1NDUklQVD8gSG93IGxpa2VseSBpcyB0aGF0IHRoaXMgaXMKPiA+IHR1cm5l
ZCBvZmY/Cgo+IENPTkZJR19NT0RVTEVTPW4gaXMgYSBjb21tb24gY29uZmlnIGZvciB0ZXN0aW5n
Cj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHRoZSBjYXNlIGZvciBDT05GSUdfQklORk1UX1NDUklQ
VAoKWWVzLCBpdCdzIGRlZmF1bHQgeSBhbmQganVzdCBicmllZmx5IGNoZWNraW5nIGl0J3MgaW4g
VHVtYmxld2VlZCBhbmQgRGViaWFuCnRlc3RpbmcgPT4gTEdUTS4KClJldmlld2VkLWJ5OiBQZXRy
IFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KCktpbmQgcmVnYXJkcywKUGV0cgoKPiA+IElmIHBvc3Np
YmxlIEkgd291bGQgbGlrZSB0byBhdm9pZCB3aGFjay1hLW1vbGUgZ2FtZSB0cnlpbmcgdG8gZmlu
ZAo+ID4gc29tZXRoaW5nIHRoYXQgaXMgY29tbW9ubHkgZW5hYmxlZC4KCj4gRmVlbCBmcmVlIHRv
IGNob29zZSBhbnkgb3RoZXIgc3ltYm9sLgoKPiBUaGFua3MsCj4gQW1pci4KCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
