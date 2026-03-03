Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM5cN5MCp2k7bgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Mar 2026 16:47:31 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CE1F2E55
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Mar 2026 16:47:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C17713DAC8A
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2026 16:47:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AE553D85B8
 for <ltp@lists.linux.it>; Tue,  3 Mar 2026 16:47:20 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CE0062009A1
 for <ltp@lists.linux.it>; Tue,  3 Mar 2026 16:47:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1AB873F883;
 Tue,  3 Mar 2026 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772552839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyWUN5TSfm/REaZKvH3oAV9Ux3qdsmUxMpya1LGzI5o=;
 b=n6/Hh/FIexoAIGJgBaFQoMKYXijGuXRWuH0TMjp0NNjL9GcyVSPgQde2KwRmGP/nYeGw3/
 5G3pxc1yj28pu8XTKE1dNNn4PiMd6KxXZPGFEqTuYEd+LMqO/OwK5X2UC0rfLaG7W5Qbau
 f8/A9lCcj6RXQljIxWq7KILnaRDpbvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772552839;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyWUN5TSfm/REaZKvH3oAV9Ux3qdsmUxMpya1LGzI5o=;
 b=OHWJ/ewwHkUHMaDHnXtrwpiCXqwh7XLDPz2HaEebsI3NW3o4ltC5+AqNxNu25dq+qELyV5
 r44MejLPdWPSq0AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772552839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyWUN5TSfm/REaZKvH3oAV9Ux3qdsmUxMpya1LGzI5o=;
 b=n6/Hh/FIexoAIGJgBaFQoMKYXijGuXRWuH0TMjp0NNjL9GcyVSPgQde2KwRmGP/nYeGw3/
 5G3pxc1yj28pu8XTKE1dNNn4PiMd6KxXZPGFEqTuYEd+LMqO/OwK5X2UC0rfLaG7W5Qbau
 f8/A9lCcj6RXQljIxWq7KILnaRDpbvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772552839;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyWUN5TSfm/REaZKvH3oAV9Ux3qdsmUxMpya1LGzI5o=;
 b=OHWJ/ewwHkUHMaDHnXtrwpiCXqwh7XLDPz2HaEebsI3NW3o4ltC5+AqNxNu25dq+qELyV5
 r44MejLPdWPSq0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C4E03EA69;
 Tue,  3 Mar 2026 15:47:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OfElAocCp2mhYgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 03 Mar 2026 15:47:19 +0000
Date: Tue, 3 Mar 2026 16:47:28 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Pavithra <pavrampu@linux.ibm.com>
Message-ID: <aacCkAN6a1Imktjt@yuki.lan>
References: <20250925060046.1006111-1-pavrampu@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925060046.1006111-1-pavrampu@linux.ibm.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v6] Origin:
 https://github.com/libhugetlbfs/libhugetlbfs/blob/master/tests/shm-getraw.c
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
Cc: ltp@lists.linux.it, Pavithra <pavrampu@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 782CE1F2E55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.cz:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.875];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:email,yuki.lan:mid]
X-Rspamd-Action: no action

SGkhCkZpcnN0IG9mIGFsbCB0aGUgc3ViamVjdCBvZiB0aGUgcGF0Y2ggc2hvdWxkIGJlIG1vcmUg
bWVhbmluZ2Z1bCBzdWNoIGFzOgoKInN5c2NhbGxzOiBpcGM6IEFkZCBzaG1nZXQgaHVnZXBhZ2Ug
dGVzdCIKCmluc3RlYWQgb2YgdGhlCgoiT3JpZ2luOiBodHRwczovL2dpdGh1Yi5jb20vbGliaHVn
ZXRsYmZzL2xpYmh1Z2V0bGJmcy9ibG9iL21hc3Rlci90ZXN0cy9zaG0tZ2V0cmF3LmMiCgo+IFRo
ZSB0ZXN0IGNyZWF0ZXMgYSBzaGFyZWQgbWVtb3J5IHNlZ21lbnQsIHRoZW4gYXR0YWNoZXMgaXQg
dG8gdGhlIHByb2Nlc3PigJlzIGFkZHJlc3Mgc3BhY2UuCj4gSXQgd3JpdGVzIGEgc3RyaW5nIHRv
IHRoZSBzaGFyZWQgbWVtb3J5IGZyb20gcmF3IGRldmljZSBhbmQgZGV0YWNoZXMgdGhlIHNoYXJl
ZCBtZW1vcnkKPiBzZWdtZW50IGFuZCBmaW5hbGx5IHJlbW92ZXMgaXQuCj4gVGhlIHB1cnBvc2Ug
b2YgdGhpcyB0ZXN0IGlzIHRvIGVuc3VyZSB0aGF0IHRoZSBzaGFyZWQgbWVtb3J5IHN1YnN5c3Rl
bSBpcyB3b3JraW5nIGNvcnJlY3RseQo+IHdpdGggaHVnZXBhZ2VzLiBJdCBjaGVja3MgdGhhdCBz
aGFyZWQgbWVtb3J5IHNlZ21lbnRzIGNhbiBiZSBjcmVhdGVkLCBhdHRhY2hlZCwgd3JpdHRlbiB0
bywKPiByZWFkIGZyb20sIGRldGFjaGVkLCBhbmQgcmVtb3ZlZCB3aXRob3V0IGVycm9ycwo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBhdml0aHJhIDxwYXZyYW1wdUBsaW51eC52bmV0LmlibS5jb20+Cj4g
LS0tCj4gIHJ1bnRlc3Qvc3lzY2FsbHMtaXBjICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKPiAgdGVzdGNhc2VzL2tlcm5lbC9tZW0vLmdpdGlnbm9yZSAgICAgICAgICAgICAgIHwgIDEg
Kwo+ICAuLi4va2VybmVsL3N5c2NhbGxzL2lwYy9zaG1nZXQvc2htZ2V0MDcuYyAgICAgfCA3MyAr
KysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pcGMvc2htZ2V0
L3NobWdldDA3LmMKPiAKPiBkaWZmIC0tZ2l0IGEvcnVudGVzdC9zeXNjYWxscy1pcGMgYi9ydW50
ZXN0L3N5c2NhbGxzLWlwYwo+IGluZGV4IDg5NjBjNDg3Yy4uNDE1OWYyMzMxIDEwMDY0NAo+IC0t
LSBhL3J1bnRlc3Qvc3lzY2FsbHMtaXBjCj4gKysrIGIvcnVudGVzdC9zeXNjYWxscy1pcGMKPiBA
QCAtNjYsMyArNjYsNCBAQCBzaG1nZXQwMyBzaG1nZXQwMwo+ICBzaG1nZXQwNCBzaG1nZXQwNAo+
ICBzaG1nZXQwNSBzaG1nZXQwNQo+ICBzaG1nZXQwNiBzaG1nZXQwNgo+ICtzaG1nZXQwNyBzaG1n
ZXQwNwo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL21lbS8uZ2l0aWdub3JlIGIvdGVz
dGNhc2VzL2tlcm5lbC9tZW0vLmdpdGlnbm9yZQo+IGluZGV4IGI0NDU1ZGU1MS4uZjk0Mzg2MDZl
IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtLy5naXRpZ25vcmUKPiArKysgYi90
ZXN0Y2FzZXMva2VybmVsL21lbS8uZ2l0aWdub3JlCj4gQEAgLTUwLDYgKzUwLDcgQEAKPiAgL2h1
Z2V0bGIvaHVnZXNobWdldC9odWdlc2htZ2V0MDMKPiAgL2h1Z2V0bGIvaHVnZXNobWdldC9odWdl
c2htZ2V0MDUKPiAgL2h1Z2V0bGIvaHVnZXNobWdldC9odWdlc2htZ2V0MDYKPiArL2h1Z2V0bGIv
aHVnZXNobWdldC9odWdlc2htZ2V0MDcKPiAgL2tzbS9rc20wMQo+ICAva3NtL2tzbTAyCj4gIC9r
c20va3NtMDMKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pcGMvc2ht
Z2V0L3NobWdldDA3LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lwYy9zaG1nZXQvc2ht
Z2V0MDcuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwLi5iMWJlZTA2
ZjkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pcGMv
c2htZ2V0L3NobWdldDA3LmMKPiBAQCAtMCwwICsxLDczIEBACj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMR1BMLTIuMS1vci1sYXRlcgo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIw
MDUtMjAwNiBEYXZpZCBHaWJzb24gJiBBZGFtIExpdGtlLCBJQk0gQ29ycG9yYXRpb24uCj4gKyAq
Lwo+ICsKPiArLypcCj4gKyAqIFtEZXNjcmlwaXRvbl0KPiArICoKPiArICogT3JpZ2luOiBodHRw
czovL2dpdGh1Yi5jb20vbGliaHVnZXRsYmZzL2xpYmh1Z2V0bGJmcy9ibG9iL21hc3Rlci90ZXN0
cy9zaG0tZ2V0cmF3LmMKPiArICoKPiArICogVGhlIHRlc3QgY3JlYXRlcyBhIHNoYXJlZCBtZW1v
cnkgc2VnbWVudCwgdGhlbiBhdHRhY2hlcyBpdCB0byB0aGUgcHJvY2Vzc+KAmXMgYWRkcmVzcyBz
cGFjZS4KPiArICogSXQgd3JpdGVzIGEgc3RyaW5nIHRvIHRoZSBzaGFyZWQgbWVtb3J5IGZyb20g
cmF3IGRldmljZSBhbmQgZGV0YWNoZXMgdGhlIHNoYXJlZCBtZW1vcnkKPiArICogc2VnbWVudCBh
bmQgZmluYWxseSByZW1vdmVzIGl0Lgo+ICsgKiBUaGUgcHVycG9zZSBvZiB0aGlzIHRlc3QgaXMg
dG8gZW5zdXJlIHRoYXQgdGhlIHNoYXJlZCBtZW1vcnkgc3Vic3lzdGVtIGlzIHdvcmtpbmcgY29y
cmVjdGx5Cj4gKyAqIHdpdGggaHVnZXBhZ2VzLiBJdCBjaGVja3MgdGhhdCBzaGFyZWQgbWVtb3J5
IHNlZ21lbnRzIGNhbiBiZSBjcmVhdGVkLCBhdHRhY2hlZCwgd3JpdHRlbiB0bywKPiArICogcmVh
ZCBmcm9tLCBkZXRhY2hlZCwgYW5kIHJlbW92ZWQgd2l0aG91dCBlcnJvcnMKPiArICoKPiArICov
Cj4gKwo+ICsjaW5jbHVkZSAiLi4vLi4vLi4vbWVtL2h1Z2V0bGIvbGliL2h1Z2V0bGIuaCIKCllv
dSBuZWVkIHRvIGluY2x1ZGUgInRzdF90ZXN0LmgiIGFuZCAidHN0X2h1Z2VwYWdlLmgiIGluc3Rl
YWQgb2YgdGhlCmxvY2FsIGhlYWRlcnMuCgo+ICsjaW5jbHVkZSAidHN0X3NhZmVfc3lzdl9pcGMu
aCIKPiArCj4gKyNkZWZpbmUgTU5UUE9JTlQgImh1Z2V0bGJmcy8iCj4gKyNkZWZpbmUgTlJfSFVH
RVBBR0VTIDIKPiArCj4gK3N0YXRpYyBpbnQgc2htaWQgPSAtMTsKPiArc3RhdGljIHNpemVfdCBz
aXplOwo+ICtzdGF0aWMgc2l6ZV90IGk7Cj4gKwo+ICtzdGF0aWMgY2hhciAqc2htYWRkcjsKPiAr
c3RhdGljIGludCByYXdfZmQ7Cj4gK3N0YXRpYyBsb25nIGhwYWdlX3NpemU7Cj4gKwo+ICtzdGF0
aWMgdm9pZCBzZXR1cCh2b2lkKQo+ICt7Cj4gKwlocGFnZV9zaXplID0gdHN0X2dldF9odWdlcGFn
ZV9zaXplKCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKPiArewo+ICsJ
aWYgKHNobWlkID49IDApCj4gKwkJU0FGRV9TSE1DVEwoc2htaWQsIElQQ19STUlELCBOVUxMKTsK
PiArfQo+ICsKPiArc3RhdGljIHZvaWQgcnVuX3Rlc3Qodm9pZCkKPiArewo+ICsJc2l6ZSA9IGhw
YWdlX3NpemUgKiBOUl9IVUdFUEFHRVM7Cj4gKwlyYXdfZmQgPSBTQUZFX09QRU4oIi9kZXYvemVy
byIsIE9fUkRPTkxZKTsKPiArCj4gKwlzaG1pZCA9IFNBRkVfU0hNR0VUKElQQ19QUklWQVRFLCBz
aXplLCBTSE1fSFVHRVRMQnxTSE1fUnxTSE1fVyk7Cj4gKwo+ICsJc2htYWRkciA9IFNBRkVfU0hN
QVQoc2htaWQsIDAsIFNITV9STkQpOwo+ICsJdHN0X3JlcyhUSU5GTywgInNobWFkZHI6ICVwXG4i
LCBzaG1hZGRyKTsKPiArCj4gKwkvKiBSZWFkIGEgcGFnZSBmcm9tIGRldmljZSBhbmQgd3JpdGUg
dG8gc2htIHNlZ21lbnQgKi8KPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgc2l6ZTsgaSArPSBocGFn
ZV9zaXplKSB7Cj4gKwkJVFNUX1JFVCA9IHJlYWQocmF3X2ZkLCBzaG1hZGRyLCBocGFnZV9zaXpl
KTsKCllvdSBuZWVkIHRvIHVzZSB3aG9sZSBURVNUKCkgbWFjcm8gb3RoZXJ3aXNlIHlvdSBjYW5u
b3QgdXNlIFRFUlJOTyBpbgp0aGUgdHN0X3JlcyBiZWxvdy4KCj4gKwkJVFNUX0VYUF9WQUwoVFNU
X1JFVCwgaHBhZ2Vfc2l6ZSwgInJlYWQgcmV0dXJuZWQgJWxkIiwgVFNUX1JFVCk7Cj4gKwkJaWYg
KFRTVF9SRVQgIT0gaHBhZ2Vfc2l6ZSkKPiArCQkJdHN0X3JlcyhURkFJTCB8IFRFUlJOTywgIkNh
bid0IHJlYWQgZnVsbCBwYWdlIGZyb20gcmF3IGRldmljZSEiKTsKPiArCX0KPiArCj4gKwlTQUZF
X1NITURUKHNobWFkZHIpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3Qg
PSB7Cj4gKwkubmVlZHNfcm9vdCA9IDEsCj4gKwkuc2V0dXAgPSBzZXR1cCwKPiArCS5jbGVhbnVw
ID0gY2xlYW51cCwKPiArCS50ZXN0X2FsbCA9IHJ1bl90ZXN0LAo+ICsJLmh1Z2VwYWdlcyA9IHsy
LCBUU1RfTkVFRFN9LAo+ICt9Owo+IC0tIAo+IDIuNDMuNQoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1
YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
