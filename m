Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA6750287
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jul 2023 11:08:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EE7A3CB7BC
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jul 2023 11:08:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 628343C99A2
 for <ltp@lists.linux.it>; Wed, 12 Jul 2023 11:08:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 825841A008BC
 for <ltp@lists.linux.it>; Wed, 12 Jul 2023 11:08:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6111F22596;
 Wed, 12 Jul 2023 09:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689152887;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HlVq2SkrdFnXniirobZqdLyBJppnt6SpVAdXrzY719s=;
 b=bnwfNcs2HHjVRk6Ji08NED2rUhDi1hZB2/3a3zwqMzRAmrWznkjJuzCgesXZUbukQRPUOf
 EyqsoEt2WBcO5CsXe2LqEj37AeJtpKoe5OcDRk/0pUnwt8ra3q/Xa3iGe7/GWf10hjEoAM
 rJmmdn8EENQtequpugSgA5H3LFy2i38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689152887;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HlVq2SkrdFnXniirobZqdLyBJppnt6SpVAdXrzY719s=;
 b=qcU/b7+4OoeIfunBQ6laEwmE4eeEFRtaxCVa3UZLYchF/jGSfd656kcwZ64sbPBLdc492g
 YRubGElBmWw1NJDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45A45133DD;
 Wed, 12 Jul 2023 09:08:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZU23D3dtrmTIXQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 12 Jul 2023 09:08:07 +0000
Date: Wed, 12 Jul 2023 11:08:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20230712090805.GC756025@pevik>
References: <20230705115400.31041-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705115400.31041-1-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Remove libclone dependency from pidns05 test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQW5kcmVhLAoKPiBGcm9tOiBBbmRyZWEgQ2VydmVzYXRvIDxhbmRyZWEuY2VydmVzYXRvQHN1
c2UuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWEgQ2VydmVzYXRvIDxhbmRyZWEuY2VydmVz
YXRvQHN1c2UuY29tPgo+IC0tLQpuaXQ6IHdpdGggc28gbWFueSBpbnB1dHMgeW91IGdldCBmcm9t
IEN5cmlsLCBpdCdkIHJlYWxseSBoZWxwIHJldmlld2VycyBpZiB5b3UKd3JvdGUgY2hhbmdlbG9n
IChuaWNlIGV4YW1wbGU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2x0cC8yMDIzMDcxMTE3MDMz
NS4xMzE0Mi0xLXJpY2sucC5lZGdlY29tYmVAaW50ZWwuY29tLykuCgpJIGFncmVlIGl0J3MgdGVk
aW91cyBhbmQgYm9yaW5nIGJ1dCBub3Qgb25seSBpdCdkIGhlbHAgcmV2aWV3ZXJzLCBidXQgaXQn
ZCBoZWxwCnlvdSB0byBjaGVjayBpZiB5b3UgY2hhbmdlZCBldmVyeXRoaW5nIHlvdSBoYWQgYmVl
biBhc2tlZCB0by4KCj4gIHRlc3RjYXNlcy9rZXJuZWwvY29udGFpbmVycy9waWRucy9waWRuczA1
LmMgfCAyODUgKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDc3IGluc2Vy
dGlvbnMoKyksIDIwOCBkZWxldGlvbnMoLSkKCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvY29udGFpbmVycy9waWRucy9waWRuczA1LmMgYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRhaW5l
cnMvcGlkbnMvcGlkbnMwNS5jCj4gaW5kZXggNzllMTQ2ZTM2Li5kM2JlNGJlMTEgMTAwNjQ0Cj4g
LS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9jb250YWluZXJzL3BpZG5zL3BpZG5zMDUuYwo+ICsrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvY29udGFpbmVycy9waWRucy9waWRuczA1LmMKPiBAQCAtMSwyNTYg
KzEsMTI1IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVy
Cj4gIC8qCj4gLSogQ29weXJpZ2h0IChjKSBJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVz
IENvcnAuLCAyMDA3Cj4gLSogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPiAtKiBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+IC0qIHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2Us
IG9yCj4gLSogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPiAtKiBUaGlzIHBy
b2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bAo+
IC0qIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCj4gLSogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiBTZWUKPiAtKiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1v
cmUgZGV0YWlscy4KPiAtKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQo+IC0qIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBp
ZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCj4gLSogRm91bmRhdGlvbiwgSW5jLiwg
NTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVT
QQo+IC0qCj4gLSoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IC0qCj4gLSogQXNzZXJ0aW9uOgo+IC0qICAg
YSkgQ3JlYXRlIGEgIGNvbnRhaW5lci4KPiAtKiAgIGIpIENyZWF0ZSBtYW55IGxldmVscyBvZiBj
aGlsZCBjb250YWluZXJzIGluc2lkZSB0aGlzIGNvbnRhaW5lci4KPiAtKiAgIGMpIE5vdyBkbyBr
aWxsIC05IGluaXQgLCBvdXRzaWRlIG9mIHRoZSBjb250YWluZXIuCj4gLSogICBkKSBUaGlzIHNo
b3VsZCBraWxsIGFsbCB0aGUgY2hpbGQgY29udGFpbmVycy4KPiAtKiAgICAgIChjb250YWluZXJz
IGNyZWF0ZWQgYXQgdGhlIGxldmVsIGJlbG93KQo+IC0qCj4gLSogRGVzY3JpcHRpb246Cj4gLSog
MS4gUGFyZW50IHByb2Nlc3MgY2xvbmUgYSBwcm9jZXNzIHdpdGggZmxhZyBDTE9ORV9ORVdQSUQK
PiAtKiAyLiBUaGUgY29udGFpbmVyIHdpbGwgcmVjdXJzaXZlbHkgbG9vcCBhbmQgY3JlYXRlcyA0
IG1vcmUgY29udGFpbmVycy4KPiAtKiAzLiBBbGwgdGhlIGNvbnRhaW5lciBpbml0J3MgIGdvZXMg
aW50byBzbGVlcCgpLCB3YWl0aW5nIHRvIGJlIHRlcm1pbmF0ZWQuCj4gLSogNC4gVGhlIHBhcmVu
dCBwcm9jZXNzIHdpbGwga2lsbCBjaGlsZFszXSBieSBwYXNzaW5nIFNJR0tJTEwKPiAtKiA1LiBO
b3cgcGFyZW50IHByb2Nlc3MsIHZlcmlmaWVzIHRoZSBjaGlsZCBjb250YWluZXJzIDQgJiA1IGFy
ZSBkZXN0cm95ZWQuCj4gLSogNi4gSWYgdGhleSBhcmUga2lsbGVkIHRoZW4KPiAtKglUZXN0IHBh
c3NlZAo+IC0qICBlbHNlIFRlc3QgZmFpbGVkLgo+IC0qCj4gLSogVGVzdCBOYW1lOiBwaWRuczA1
Cj4gLSoKPiAtKiBIaXN0b3J5Ogo+IC0qCj4gLSogRkxBRyBEQVRFCQlOQU1FCQkJCURFU0NSSVBU
SU9OCj4gLSogMzEvMTAvMDggIFZlZXJlbmRyYSBDIDx2ZWNoYW5kckBpbi5pYm0uY29tPglWZXJp
ZmllcyBraWxsaW5nIG9mIE5lc3RlZENvbnQncwo+IC0qCj4gLSoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KiovCj4gLSNkZWZpbmUgX0dOVV9TT1VSQ0UgMQo+ICsgKiBDb3B5cmlnaHQgKGMpIEludGVybmF0
aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgQ29ycC4sIDIwMDcKPiArICoJCTA4LzEwLzA4IFZlZXJl
bmRyYSBDIDx2ZWNoYW5kckBpbi5pYm0uY29tPgp2ZXJ5IG5pdDogMzEvMTAvMDggPT4gMDgvMTAv
MDguIElNSE8gd3JvbmcgZGF0ZS4gT3Igd2hhdCBhbSBJIG1pc3NpbmcgaGVyZT8KQWxzbyB3aHkg
dGFiIGluIHRoZSBmcm9udD8gTWF5YmUgSSdtIGEgYml0IGFnZ3Jlc3NpdmUgd2hlbiBkZWxldGlu
ZyBmcm9tIG15IFBPVgp1c2VsZXNzIGluZm8gYW5kIHVnbHkgZm9ybWF0dGluZywgYnV0IEknZCBq
dXN0IGFkZDoKCiogQ29weXJpZ2h0IChjKSBWZWVyZW5kcmEgQyA8dmVjaGFuZHJAaW4uaWJtLmNv
bT4sIDIwMDgKCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBTVVNFIExMQyBBbmRyZWEgQ2VydmVz
YXRvIDxhbmRyZWEuY2VydmVzYXRvQHN1c2UuY29tPgo+ICsgKi8KLi4uCgorc3RhdGljIGludCBm
aW5kX2Npbml0X3BpZHMocGlkX3QgKnBpZHMpCit7CisJaW50IGk7CisgICAgaW50IG5leHQgPSAw
OworICAgIHBpZF90IHBhcmVudHBpZCwgcGdpZCwgcGdpZDI7CisKKyAgICBwYXJlbnRwaWQgPSBn
ZXRwaWQoKTsKKyAgICBwZ2lkID0gZ2V0cGdpZChwYXJlbnRwaWQpOwpNYXliZSBTQUZFX0dFVFBH
SUQoKSA/CgouLi4KCj4gK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQouLi4KPiArCVNBRkVfS0lMTChw
aWQsIFNJR0tJTEwpOwo+ICsJU0FGRV9XQUlUUElEKDAsICZzdGF0dXMsIE5VTEwpOwoKSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDoxMTAsCiAgICAg
ICAgICAgICAgICAgZnJvbSBwaWRuczA1LmM6MTc6CnBpZG5zMDUuYzogSW4gZnVuY3Rpb24g4oCY
cnVu4oCZOgouLi8uLi8uLi8uLi9pbmNsdWRlL3RzdF9zYWZlX21hY3Jvcy5oOjIxMTo2NTogd2Fy
bmluZzogcGFzc2luZyBhcmd1bWVudCA2IG9mIOKAmHNhZmVfd2FpdHBpZOKAmSBtYWtlcyBpbnRl
Z2VyIGZyb20gcG9pbnRlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0KICAyMTEg
fCAgICAgICAgIHNhZmVfd2FpdHBpZChfX0ZJTEVfXywgX19MSU5FX18sIE5VTEwsIChwaWQpLCAo
c3RhdHVzKSwgKG9wdHMpKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAog
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2lkICoKcGlkbnMwNS5jOjEwMTo5OiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8g4oCYU0FGRV9XQUlUUElE4oCZCiAgMTAxIHwgICAgICAgICBTQUZFX1dBSVRQSUQo
MCwgJnN0YXR1cywgTlVMTCk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn4KSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3NhZmVfbWFjcm9zLmg6MjQ6Ci4u
Ly4uLy4uLy4uL2luY2x1ZGUvc2FmZV9tYWNyb3NfZm4uaDoxNTg6NDg6IG5vdGU6IGV4cGVjdGVk
IOKAmGludOKAmSBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSDigJh2b2lkICrigJkKICAxNTggfCAg
ICAgICAgICAgICAgICAgICAgcGlkX3QgcGlkLCBpbnQgKnN0YXR1cywgaW50IG9wdHMpOwogICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+Xn5+fgoK
bWFrZSBjaGVjay1waWRuczA1CkNIRUNLIHRlc3RjYXNlcy9rZXJuZWwvY29udGFpbmVycy9waWRu
cy9waWRuczA1LmMKcGlkbnMwNS5jOjEwMTo5OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBh
cmd1bWVudCA2IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKcGlkbnMwNS5jOjEwMTo5OiAgICBleHBl
Y3RlZCBpbnQgb3B0cwpwaWRuczA1LmM6MTAxOjk6ICAgIGdvdCB2b2lkICoKClRoZSBvbGQgdGVz
dCBjYWxsZWQgc2V0cGdpZCgwLCAwKSBhbmQgU0FGRV9QSVBFKCksIGFyZSB0aGVzZSByZWxhdGVk
IHRvCmRvX2Nsb25lX3Vuc2hhcmVfdGVzdCgpIG9yIHdoeSBpdCdzIG5vdCBuZWNlc3NhcnkgaW4g
dGhlIHJld3JpdGU/Ck1heWJlIGl0J3Mgb2J2aW91cywgYnV0IEknZCBhcHByZWNpYXRlIHRvIGV4
cGxhaW4gdGhlc2UgY2hhbmdlcyBpbiB0aGUgY29tbWl0Cm1lc3NhZ2UsIGluc3RlYWQgb2Ygc2lt
cGxlICJSZW1vdmUgbGliY2xvbmUgZGVwZW5kZW5jeSIuCgpUaGUgcmVzdCBMR1RNLgoKS2luZCBy
ZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
