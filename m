Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 624727D3BA8
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Oct 2023 18:03:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 028F73CF9C4
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Oct 2023 18:03:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E11463CECF5
 for <ltp@lists.linux.it>; Mon, 23 Oct 2023 18:02:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 27E3714010F7
 for <ltp@lists.linux.it>; Mon, 23 Oct 2023 18:02:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B037021B05;
 Mon, 23 Oct 2023 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698076967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0s7goIr10tGSfd3qExNHQEimfmraYlgwoXK4NZEKUtQ=;
 b=aYysiT5lUI0Fy9efOwaXBIw8IWR6bijzgiTdnpOl8ECOBX0TXwiXZCW5Ce+V8ZPaBBCIv/
 RK241ErIVgcC1oHsv3EJ5ATohZdYzPBn7GpTZzi7TvryHn67koMhHX1jTwGYz0yiDnDG+o
 HVNs+A0i5iuB04AmeVw+d4BZ3FgSxS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698076967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0s7goIr10tGSfd3qExNHQEimfmraYlgwoXK4NZEKUtQ=;
 b=XN/vnGs47nJXHLw6BAffDGWYDEhe5YyVQjIYTKGrVEK5naTUcNqhFDHuXtyEzUGk1MzFiR
 qtd5VVPu0e/0hLAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 923F9132FD;
 Mon, 23 Oct 2023 16:02:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eIVTIieZNmVhJAAAMHmgww
 (envelope-from <mkittler@suse.de>); Mon, 23 Oct 2023 16:02:47 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp@lists.linux.it
Date: Mon, 23 Oct 2023 18:02:38 +0200
Message-ID: <20231023160242.3605-2-mkittler@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231023160242.3605-1-mkittler@suse.de>
References: <20231023160242.3605-1-mkittler@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -10.10
X-Spamd-Result: default: False [-10.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-3.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 MID_CONTAINS_FROM(1.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v7 1/5] Refactor ioctl02.c to use the new test API
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

KiBVc2UgY2hlY2twb2ludCBBUEkgaW5zdGVhZCBvZiBzaWduYWxzCiogVXNlIFNBRkVf4oCmLW1h
Y3JvcyBpbnN0ZWFkIG9mIG1hbnVhbCBlcnJvciBoYW5kbGluZwoqIFNlZSBodHRwczovL2dpdGh1
Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9pc3N1ZXMvNjM3CiAgZm9yIHJlbGF0ZWQgZGlz
Y3Vzc2lvbi4KClNpZ25lZC1vZmYtYnk6IE1hcml1cyBLaXR0bGVyIDxta2l0dGxlckBzdXNlLmRl
PgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGwwMi5jIHwgNDExICsr
KysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCAz
MTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9p
b2N0bC9pb2N0bDAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsMDIu
YwppbmRleCBiNGQ0YTM1OTQuLmIwMzc2NzQ4ZCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9pb2N0bC9pb2N0bDAyLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9pb2N0bC9pb2N0bDAyLmMKQEAgLTEsMjI4ICsxLDkxIEBACisvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgogLyoKLSAqICAgQ29weXJpZ2h0IChjKSBJbnRlcm5h
dGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzICBDb3JwLiwgMjAwMQotICogICBDb3B5cmlnaHQgKGMp
IDIwMjAgUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0gKgotICogICBUaGlzIHByb2dyYW0g
aXMgZnJlZSBzb2Z0d2FyZTsgIHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
LSAqICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBhcyBwdWJsaXNoZWQgYnkKLSAqICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0
aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKLSAqICAgKGF0IHlvdXIgb3B0aW9uKSBh
bnkgbGF0ZXIgdmVyc2lvbi4KLSAqCi0gKiAgIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBp
biB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAotICogICBidXQgV0lUSE9VVCBBTlkg
V0FSUkFOVFk7ICB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSAqICAgTUVS
Q0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlCi0g
KiAgIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgotICoK
LSAqICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UKLSAqICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07ICBpZiBub3QsIHdy
aXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCi0gKiAgIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5r
bGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyAqIENv
cHlyaWdodCAoYykgSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyAgQ29ycC4sIDIwMDEK
KyAqIENvcHlyaWdodCAoYykgMjAyMCBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KKyAqIENv
cHlyaWdodCAoYykgMjAyMyBNYXJpdXMgS2l0dGxlciA8bWtpdHRsZXJAc3VzZS5kZT4KICAqLwog
Ci0vKgotICogTkFNRQotICoJaW9jdGwwMi5jCi0gKgotICogREVTQ1JJUFRJT04KLSAqCVRlc3Rj
YXNlIHRvIHRlc3QgdGhlIFRDR0VUQSwgYW5kIFRDU0VUQSBpb2N0bCBpbXBsZW1lbnRhdGlvbnMg
Zm9yCi0gKgl0aGUgdHR5IGRyaXZlcgotICoKLSAqIEFMR09SSVRITQotICoJSW4gdGhpcyB0ZXN0
LCB0aGUgcGFyZW50IGFuZCBjaGlsZCBvcGVuIHRoZSBwYXJlbnR0eSBhbmQgdGhlIGNoaWxkdHR5
Ci0gKglyZXNwZWN0aXZlbHkuICBBZnRlciBvcGVuaW5nIHRoZSBjaGlsZHR0eSB0aGUgY2hpbGQg
Zmx1c2hlcyB0aGUgc3RyZWFtCi0gKglhbmQgc2VuZHMgYSBTSUdVU1IxIHRvIHRoZSBwYXJlbnQg
KHRoZXJlYnkgYXNraW5nIGl0IHRvIGNvbnRpbnVlIGl0cwotICoJdGVzdGluZykuIFRoZSBwYXJl
bnQsIHdoaWNoIHdhcyB3YWl0aW5nIGZvciB0aGlzIHNpZ25hbCB0byBhcnJpdmUsIG5vdwotICoJ
c3RhcnRzIHRoZSB0ZXN0aW5nLiBJdCBpc3N1ZXMgYSBUQ0dFVEEgaW9jdGwgdG8gZ2V0IGFsbCB0
aGUgdHR5Ci0gKglwYXJhbWV0ZXJzLiBJdCB0aGVuIGNoYW5nZXMgdGhlbSB0byBrbm93biB2YWx1
ZXMgYnkgaXNzdWluZyBhIFRDU0VUQQotICoJaW9jdGwuICBUaGVuIHRoZSBwYXJlbnQgaXNzdWVz
IGEgVENHRVRBIGlvY3RsIGFnYWluIGFuZCBjb21wYXJlcyB0aGUKLSAqCXJlY2VpdmVkIHZhbHVl
cyB3aXRoIHdoYXQgaXQgaGFkIHNldCBlYXJsaWVyLiBUaGUgdGVzdCBmYWlscyBpZiBUQ0dFVEEK
LSAqCW9yIFRDU0VUQSBmYWlscywgb3IgaWYgdGhlIHJlY2VpdmVkIHZhbHVlcyBkb24ndCBtYXRj
aCB0aG9zZSB0aGF0IHdlcmUKLSAqCXNldC4gVGhlIHBhcmVudCBkb2VzIGFsbCB0aGUgdGVzdGlu
ZywgdGhlIHJlcXVpcmVtZW50IG9mIHRoZSBjaGlsZAotICoJcHJvY2VzcyBpcyB0byBtb25pdGVy
IHRoZSB0ZXN0aW5nIGRvbmUgYnkgdGhlIHBhcmVudCwgYW5kIGhlbmNlIHRoZQotICoJY2hpbGQg
anVzdCB3YWl0cyBmb3IgdGhlIHBhcmVudC4KKy8qXAorICogW0Rlc2NyaXB0aW9uXQogICoKLSAq
IFVTQUdFOiAgPGZvciBjb21tYW5kLWxpbmU+Ci0gKiAgaW9jdGwwMiAtRCAvZGV2L3R0eVswLTld
IFstYyBuXSBbLWZdIFstaSBuXSBbLUkgeF0gWy1QIHhdIFstdF0KLSAqICAgICB3aGVyZSwgIC1j
IG4gOiBSdW4gbiBjb3BpZXMgY29uY3VycmVudGx5LgotICogICAgICAgICAgICAgLWYgICA6IFR1
cm4gb2ZmIGZ1bmN0aW9uYWxpdHkgVGVzdGluZy4KLSAqICAgICAgICAgICAgIC1pIG4gOiBFeGVj
dXRlIHRlc3QgbiB0aW1lcy4KLSAqICAgICAgICAgICAgIC1JIHggOiBFeGVjdXRlIHRlc3QgZm9y
IHggc2Vjb25kcy4KLSAqICAgICAgICAgICAgIC1QIHggOiBQYXVzZSBmb3IgeCBzZWNvbmRzIGJl
dHdlZW4gaXRlcmF0aW9ucy4KLSAqICAgICAgICAgICAgIC10ICAgOiBUdXJuIG9uIHN5c2NhbGwg
dGltaW5nLgorICogVGVzdGNhc2UgdG8gdGVzdCB0aGUgVENHRVRBLCBhbmQgVENTRVRBIGlvY3Rs
IGltcGxlbWVudGF0aW9ucyBmb3IKKyAqIHRoZSB0dHkgZHJpdmVyCiAgKgotICogSElTVE9SWQot
ICoJMDcvMjAwMSBQb3J0ZWQgYnkgV2F5bmUgQm95ZXIKLSAqCi0gKiBSRVNUUklDVElPTlMKLSAq
CXRlc3QgbXVzdCBiZSBydW4gd2l0aCB0aGUgLUQgb3B0aW9uCi0gKgl0ZXN0IG1heSBoYXZlIHRv
IGJlIHJ1biBhcyByb290IGRlcGVuZGluZyBvbiB0aGUgdHR5IHBlcm1pc3Npb25zCisgKiBJbiB0
aGlzIHRlc3QsIHRoZSBwYXJlbnQgYW5kIGNoaWxkIG9wZW4gdGhlIHBhcmVudHR5IGFuZCB0aGUg
Y2hpbGR0dHkKKyAqIHJlc3BlY3RpdmVseS4gIEFmdGVyIG9wZW5pbmcgdGhlIGNoaWxkdHR5IHRo
ZSBjaGlsZCBmbHVzaGVzIHRoZSBzdHJlYW0KKyAqIGFuZCB3YWtlcyB0aGUgcGFyZW50ICh0aGVy
ZWJ5IGFza2luZyBpdCB0byBjb250aW51ZSBpdHMgdGVzdGluZykuIFRoZQorICogcGFyZW50LCB0
aGVuIHN0YXJ0cyB0aGUgdGVzdGluZy4gSXQgaXNzdWVzIGEgVENHRVRBIGlvY3RsIHRvIGdldCBh
bGwKKyAqIHRoZSB0dHkgcGFyYW1ldGVycy4gSXQgdGhlbiBjaGFuZ2VzIHRoZW0gdG8ga25vd24g
dmFsdWVzIGJ5IGlzc3VpbmcgYQorICogVENTRVRBIGlvY3RsLiBUaGVuIHRoZSBwYXJlbnQgaXNz
dWVzIGEgVENHRVRBIGlvY3RsIGFnYWluIGFuZCBjb21wYXJlcworICogdGhlIHJlY2VpdmVkIHZh
bHVlcyB3aXRoIHdoYXQgaXQgaGFkIHNldCBlYXJsaWVyLiBUaGUgdGVzdCBmYWlscyBpZgorICog
VENHRVRBIG9yIFRDU0VUQSBmYWlscywgb3IgaWYgdGhlIHJlY2VpdmVkIHZhbHVlcyBkb24ndCBt
YXRjaCB0aG9zZQorICogdGhhdCB3ZXJlIHNldC4gVGhlIHBhcmVudCBkb2VzIGFsbCB0aGUgdGVz
dGluZywgdGhlIHJlcXVpcmVtZW50IG9mIHRoZQorICogY2hpbGQgcHJvY2VzcyBpcyB0byBtb25p
dGVyIHRoZSB0ZXN0aW5nIGRvbmUgYnkgdGhlIHBhcmVudCwgYW5kIGhlbmNlCisgKiB0aGUgY2hp
bGQganVzdCB3YWl0cyBmb3IgdGhlIHBhcmVudC4KICAqLwogCiAjaW5jbHVkZSA8c3RkaW8uaD4K
ICNpbmNsdWRlIDxmY250bC5oPgotI2luY2x1ZGUgPHNpZ25hbC5oPgogI2luY2x1ZGUgPGVycm5v
Lmg+CiAjaW5jbHVkZSA8c3lzL3dhaXQuaD4KICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KICNpbmNs
dWRlIDxzeXMvc3RhdC5oPgogI2luY2x1ZGUgPHRlcm1pb3MuaD4KLSNpbmNsdWRlICJ0ZXN0Lmgi
Ci0jaW5jbHVkZSAic2FmZV9tYWNyb3MuaCIKLSNpbmNsdWRlICJsYXBpL2lvY3RsLmgiCiAKLSNk
ZWZpbmUJQ05VTAkwCisjaW5jbHVkZSAibGFwaS9pb2N0bC5oIgogCi1jaGFyICpUQ0lEID0gImlv
Y3RsMDIiOwotaW50IFRTVF9UT1RBTCA9IDE7CisjaW5jbHVkZSAidHN0X2NoZWNrcG9pbnQuaCIK
KyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorI2luY2x1ZGUgInRzdF9zYWZlX21hY3Jvcy5oIgogCiBz
dGF0aWMgc3RydWN0IHRlcm1pbyB0ZXJtaW8sIHNhdmVfaW87CiAKIHN0YXRpYyBjaGFyICpwYXJl
bnR0dHksICpjaGlsZHR0eTsKLXN0YXRpYyBpbnQgcGFyZW50ZmQsIGNoaWxkZmQ7CitzdGF0aWMg
aW50IHBhcmVudGZkID0gLTEsIGNoaWxkZmQgPSAtMTsKIHN0YXRpYyBpbnQgcGFyZW50cGlkLCBj
aGlsZHBpZDsKLXN0YXRpYyB2b2xhdGlsZSBpbnQgc2lndGVybSwgc2lndXNyMSwgc2lndXNyMjsK
LXN0YXRpYyBpbnQgY2xvc2VkID0gMTsKIAogc3RhdGljIGludCBkb19jaGlsZF9zZXR1cCh2b2lk
KTsKLXN0YXRpYyBpbnQgZG9fcGFyZW50X3NldHVwKHZvaWQpOwotc3RhdGljIGludCBydW5fcHRl
c3Qodm9pZCk7Ci1zdGF0aWMgaW50IHJ1bl9jdGVzdCh2b2lkKTsKLXN0YXRpYyBpbnQgY2hrX3R0
eV9wYXJtcygpOworc3RhdGljIHZvaWQgcnVuX3B0ZXN0KHZvaWQpOworc3RhdGljIHZvaWQgcnVu
X2N0ZXN0KHZvaWQpOworc3RhdGljIHZvaWQgY2hrX3R0eV9wYXJtcyh2b2lkKTsKIHN0YXRpYyB2
b2lkIHNldHVwKHZvaWQpOwogc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKTsKLXN0YXRpYyB2b2lk
IGhlbHAodm9pZCk7Ci1zdGF0aWMgdm9pZCBkb19jaGlsZCh2b2lkKTsKLXZvaWQgZG9fY2hpbGRf
dWNsaW51eCh2b2lkKTsKLXN0YXRpYyB2b2lkIHNpZ3Rlcm1faGFuZGxlcih2b2lkKTsKIAotc3Rh
dGljIGludCBEZXZmbGFnOwotc3RhdGljIGNoYXIgKmRldm5hbWU7CitzdGF0aWMgY2hhciAqZGV2
aWNlOwogCi1zdGF0aWMgb3B0aW9uX3Qgb3B0aW9uc1tdID0gewotCXsiRDoiLCAmRGV2ZmxhZywg
JmRldm5hbWV9LAotCXtOVUxMLCBOVUxMLCBOVUxMfQotfTsKLQotaW50IG1haW4oaW50IGFjLCBj
aGFyICoqYXYpCitzdGF0aWMgdm9pZCB2ZXJpZnlfaW9jdGwodm9pZCkKIHsKLQlpbnQgbGM7Ci0J
aW50IHJ2YWw7Ci0KLQl0c3RfcGFyc2Vfb3B0cyhhYywgYXYsIG9wdGlvbnMsICZoZWxwKTsKLQot
I2lmZGVmIFVDTElOVVgKLQltYXliZV9ydW5fY2hpbGQoJmRvX2NoaWxkX3VjbGludXgsICJkUyIs
ICZwYXJlbnRwaWQsICZjaGlsZHR0eSk7Ci0jZW5kaWYKLQotCWlmICghRGV2ZmxhZykKLQkJdHN0
X2Jya20oVEJST0ssIE5VTEwsICJZb3UgbXVzdCBzcGVjaWZ5IGEgdHR5IGRldmljZSB3aXRoICIK
LQkJCSAidGhlIC1EIG9wdGlvbi4iKTsKLQotCXRzdF9yZXF1aXJlX3Jvb3QoKTsKLQotCXNldHVw
KCk7Ci0KLQlmb3IgKGxjID0gMDsgVEVTVF9MT09QSU5HKGxjKTsgbGMrKykgewotCi0JCXRzdF9j
b3VudCA9IDA7Ci0KLQkJcGFyZW50dHR5ID0gZGV2bmFtZTsKLQkJY2hpbGR0dHkgPSBkZXZuYW1l
OwotCi0JCXBhcmVudHBpZCA9IGdldHBpZCgpOwotCi0JCWNoaWxkcGlkID0gRk9SS19PUl9WRk9S
SygpOwotCQlpZiAoY2hpbGRwaWQgPCAwKQotCQkJdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJm
b3JrIGZhaWxlZCIpOwotCi0JCWlmIChjaGlsZHBpZCA9PSAwKSB7CS8qIGNoaWxkICovCi0jaWZk
ZWYgVUNMSU5VWAotCQkJaWYgKHNlbGZfZXhlYyhhdlswXSwgImRTIiwgcGFyZW50cGlkLCBjaGls
ZHR0eSkgPCAwKQotCQkJCXRzdF9icmttKFRCUk9LLCBjbGVhbnVwLCAic2VsZl9leGVjIGZhaWxl
ZCIpOwotI2Vsc2UKLQkJCWRvX2NoaWxkKCk7Ci0jZW5kaWYKLQkJfQotCi0JCXdoaWxlICghc2ln
dXNyMSkKLQkJCXNsZWVwKDEpOwotCi0JCXNpZ3VzcjEgPSAwOwotCi0JCXBhcmVudGZkID0gZG9f
cGFyZW50X3NldHVwKCk7Ci0JCWlmIChwYXJlbnRmZCA8IDApIHsKLQkJCWtpbGwoY2hpbGRwaWQs
IFNJR1RFUk0pOwotCQkJd2FpdHBpZChjaGlsZHBpZCwgTlVMTCwgMCk7Ci0JCQljbGVhbnVwKCk7
Ci0JCX0KLQotCQkvKiBydW4gdGhlIHBhcmVudCB0ZXN0ICovCi0JCXJ2YWwgPSBydW5fcHRlc3Qo
KTsKLQkJaWYgKHJ2YWwgPT0gLTEpIHsKLQkJCS8qCi0JCQkgKiBQYXJlbnQgY2Fubm90IHNldC9n
ZXQgaW9jdGwgcGFyYW1ldGVycy4KLQkJCSAqIFNJR1RFUk0gdGhlIGNoaWxkIGFuZCBjbGVhbnVw
LgotCQkJICovCi0JCQlraWxsKGNoaWxkcGlkLCBTSUdURVJNKTsKLQkJCXdhaXRwaWQoY2hpbGRw
aWQsIE5VTEwsIDApOwotCQkJY2xlYW51cCgpOwotCQl9Ci0KLQkJaWYgKHJ2YWwgIT0gMCkKLQkJ
CXRzdF9yZXNtKFRGQUlMLCAiVENHRVRBL1RDU0VUQSB0ZXN0cyBGQUlMRUQgd2l0aCAiCi0JCQkJ
ICIlZCAlcyIsIHJ2YWwsIHJ2YWwgPiAxID8gImVycm9ycyIgOiAiZXJyb3IiKTsKLQkJZWxzZQot
CQkJdHN0X3Jlc20oVFBBU1MsICJUQ0dFVEEvVENTRVRBIHRlc3RzIFNVQ0NFRURFRCIpOwotCi0J
CS8qIEZJWE1FOiBjaGVjayByZXR1cm4gY29kZXMuICovCi0JCSh2b2lkKWtpbGwoY2hpbGRwaWQs
IFNJR1RFUk0pOwotCQkodm9pZCl3YWl0cGlkKGNoaWxkcGlkLCBOVUxMLCAwKTsKLQotCQkvKgot
CQkgKiBDbGVhbiB1cCB0aGluZ3MgZnJvbSB0aGUgcGFyZW50IGJ5IHJlc3RvcmluZyB0aGUKLQkJ
ICogdHR5IGRldmljZSBpbmZvcm1hdGlvbiB0aGF0IHdhcyBzYXZlZCBpbiBzZXR1cCgpCi0JCSAq
IGFuZCBjbG9zaW5nIHRoZSB0dHkgZmlsZSBkZXNjcmlwdG9yLgotCQkgKi8KLQkJaWYgKGlvY3Rs
KHBhcmVudGZkLCBUQ1NFVEEsICZzYXZlX2lvKSA9PSAtMSkKLQkJCXRzdF9yZXNtKFRJTkZPLCAi
aW9jdGwgcmVzdG9yZSBmYWlsZWQgaW4gbWFpbiIpOwotCQlTQUZFX0NMT1NFKGNsZWFudXAsIHBh
cmVudGZkKTsKLQotCQljbG9zZWQgPSAxOworCXBhcmVudHR0eSA9IGRldmljZTsKKwljaGlsZHR0
eSA9IGRldmljZTsKKworCXBhcmVudHBpZCA9IGdldHBpZCgpOworCWNoaWxkcGlkID0gU0FGRV9G
T1JLKCk7CisJaWYgKCFjaGlsZHBpZCkgeworCQljaGlsZGZkID0gZG9fY2hpbGRfc2V0dXAoKTsK
KwkJaWYgKGNoaWxkZmQgPCAwKQorCQkJX2V4aXQoMSk7CisJCXJ1bl9jdGVzdCgpOworCQlfZXhp
dCgwKTsKIAl9Ci0JY2xlYW51cCgpOwogCi0JdHN0X2V4aXQoKTsKLX0KKwlUU1RfQ0hFQ0tQT0lO
VF9XQUlUKDApOwogCi1zdGF0aWMgdm9pZCBkb19jaGlsZCh2b2lkKQotewotCWNoaWxkZmQgPSBk
b19jaGlsZF9zZXR1cCgpOwotCWlmIChjaGlsZGZkIDwgMCkKLQkJX2V4aXQoMSk7Ci0JcnVuX2N0
ZXN0KCk7Ci0JX2V4aXQoMCk7Ci19Ci0KLXZvaWQgZG9fY2hpbGRfdWNsaW51eCh2b2lkKQotewot
CXN0cnVjdCBzaWdhY3Rpb24gYWN0OworCXBhcmVudGZkID0gU0FGRV9PUEVOKHBhcmVudHR0eSwg
T19SRFdSLCAwNzc3KTsKKwkvKiBmbHVzaCB0dHkgcXVldWVzIHRvIHJlbW92ZSBvbGQgb3V0cHV0
ICovCisJU0FGRV9JT0NUTChwYXJlbnRmZCwgVENGTFNILCAyKTsKIAotCS8qIFNldCB1cCB0aGUg
c2lnbmFsIGhhbmRsZXJzIGFnYWluICovCi0JYWN0LnNhX2hhbmRsZXIgPSAodm9pZCAqKXNpZ3Rl
cm1faGFuZGxlcjsKLQlhY3Quc2FfZmxhZ3MgPSAwOwotCXNpZ2VtcHR5c2V0KCZhY3Quc2FfbWFz
ayk7Ci0JKHZvaWQpc2lnYWN0aW9uKFNJR1RFUk0sICZhY3QsIDApOworCS8qIHJ1biB0aGUgcGFy
ZW50IHRlc3QgKi8KKwlydW5fcHRlc3QoKTsKIAotCS8qIFJ1biB0aGUgbm9ybWFsIGNoaWxkICov
Ci0JZG9fY2hpbGQoKTsKKwlUU1RfQ0hFQ0tQT0lOVF9XQUtFKDApOwogfQogCiAvKgogICogcnVu
X3B0ZXN0KCkgLSBzZXR1cCB0aGUgdmFyaW91cyB0ZXJtaW8gc3RydWN0dXJlIHZhbHVlcyBhbmQg
aXNzdWUKICAqCQkgdGhlIFRDU0VUQSBpb2N0bCBjYWxsIHdpdGggdGhlIFRFU1QgbWFjcm8uCiAg
Ki8KLXN0YXRpYyBpbnQgcnVuX3B0ZXN0KHZvaWQpCitzdGF0aWMgdm9pZCBydW5fcHRlc3Qodm9p
ZCkKIHsKLQlpbnQgaSwgcnZhbDsKLQogCS8qIFVzZSAib2xkIiBsaW5lIGRpc2NpcGxpbmUgKi8K
IAl0ZXJtaW8uY19saW5lID0gMDsKIApAQCAtMjMwLDcgKzkzLDcgQEAgc3RhdGljIGludCBydW5f
cHRlc3Qodm9pZCkKIAl0ZXJtaW8uY19jZmxhZyA9IEI1MCB8IENTNyB8IENSRUFEIHwgUEFSRU5C
IHwgUEFST0REIHwgQ0xPQ0FMOwogCiAJLyogU2V0IGNvbnRyb2wgY2hhcnMuICovCi0JZm9yIChp
ID0gMDsgaSA8IE5DQzsgaSsrKSB7CisJZm9yIChpbnQgaSA9IDA7IGkgPCBOQ0M7IGkrKykgewog
CQlpZiAoaSA9PSBWRU9MMikKIAkJCWNvbnRpbnVlOwogCQl0ZXJtaW8uY19jY1tpXSA9IENTVEFS
VDsKQEAgLTI0OCw0NyArMTExLDI2IEBAIHN0YXRpYyBpbnQgcnVuX3B0ZXN0KHZvaWQpCiAJLyog
U2V0IG91dHB1dCBtb2Rlcy4gKi8KIAl0ZXJtaW8uY19vZmxhZyA9IE9QT1NUIHwgT0xDVUMgfCBP
TkxDUiB8IE9OT0NSOwogCi0JVEVTVChpb2N0bChwYXJlbnRmZCwgVENTRVRBLCAmdGVybWlvKSk7
Ci0KLQlpZiAoVEVTVF9SRVRVUk4gPCAwKSB7Ci0JCXRzdF9yZXNtKFRGQUlMLCAiaW9jdGwgVENT
RVRBIGZhaWxlZCA6ICIKLQkJCSAiZXJybm8gPSAlZCIsIFRFU1RfRVJSTk8pOwotCQlyZXR1cm4g
LTE7Ci0JfQorCVNBRkVfSU9DVEwocGFyZW50ZmQsIFRDU0VUQSwgJnRlcm1pbyk7CiAKIAkvKiBH
ZXQgdGVybWlvIGFuZCBzZWUgaWYgYWxsIHBhcmFtZXRlcnMgYWN0dWFsbHkgZ290IHNldCAqLwot
CXJ2YWwgPSBpb2N0bChwYXJlbnRmZCwgVENHRVRBLCAmdGVybWlvKTsKLQlpZiAocnZhbCA8IDAp
IHsKLQkJdHN0X3Jlc20oVEZBSUwsICJpb2N0bCBUQ0dFVEEgZmFpbGVkLiAgRW5kaW5nIHRlc3Qu
Iik7Ci0JCXJldHVybiAtMTsKLQl9Ci0KLQlyZXR1cm4gY2hrX3R0eV9wYXJtcygpOworCVNBRkVf
SU9DVEwocGFyZW50ZmQsIFRDR0VUQSwgJnRlcm1pbyk7CisJY2hrX3R0eV9wYXJtcygpOwogfQog
Ci1zdGF0aWMgaW50IHJ1bl9jdGVzdCh2b2lkKQorc3RhdGljIHZvaWQgcnVuX2N0ZXN0KHZvaWQp
CiB7Ci0JLyoKLQkgKiBXYWl0IHRpbGwgdGhlIHBhcmVudCBoYXMgZmluaXNoZWQgdGVzdGluZy4K
LQkgKi8KLQl3aGlsZSAoIXNpZ3Rlcm0pCi0JCXNsZWVwKDEpOwotCi0Jc2lndGVybSA9IDA7Ci0K
LQl0c3RfcmVzbShUSU5GTywgImNoaWxkOiBHb3QgU0lHVEVSTSBmcm9tIHBhcmVudC4iKTsKLQot
CWlmIChjbG9zZShjaGlsZGZkKSA9PSAtMSkKLQkJdHN0X3Jlc20oVElORk8sICJjbG9zZSgpIGlu
IHJ1bl9jdGVzdCgpIGZhaWxlZCIpOwotCXJldHVybiAwOworCVRTVF9DSEVDS1BPSU5UX1dBSVQo
MCk7CisJdHN0X3JlcyhUSU5GTywgImNoaWxkOiBwYXJlbnQgaGFzIGZpbmlzaGVkIHRlc3Rpbmci
KTsKKwlTQUZFX0NMT1NFKGNoaWxkZmQpOwogfQogCi1zdGF0aWMgaW50IGNoa190dHlfcGFybXMo
dm9pZCkKK3N0YXRpYyB2b2lkIGNoa190dHlfcGFybXModm9pZCkKIHsKIAlpbnQgaSwgZmxhZyA9
IDA7CiAKIAlpZiAodGVybWlvLmNfbGluZSAhPSAwKSB7Ci0JCXRzdF9yZXNtKFRJTkZPLCAibGlu
ZSBkaXNjaXBsaW5lIGhhcyBpbmNvcnJlY3QgdmFsdWUgJW8iLAorCQl0c3RfcmVzKFRJTkZPLCAi
bGluZSBkaXNjaXBsaW5lIGhhcyBpbmNvcnJlY3QgdmFsdWUgJW8iLAogCQkJIHRlcm1pby5jX2xp
bmUpOwogCQlmbGFnKys7CiAJfQpAQCAtMzAxLDcgKzE0Myw3IEBAIHN0YXRpYyBpbnQgY2hrX3R0
eV9wYXJtcyh2b2lkKQogCSAqLwogI2lmIDAKIAlpZiAodGVybWlvLmNfY2ZsYWcgIT0gKEI1MCB8
IENTNyB8IENSRUFEIHwgUEFSRU5CIHwgUEFST0REIHwgQ0xPQ0FMKSkgewotCQl0c3RfcmVzbShU
SU5GTywgImNmbGFnIGhhcyBpbmNvcnJlY3QgdmFsdWUuICVvIiwKKwkJdHN0X3JlcyhUSU5GTywg
ImNmbGFnIGhhcyBpbmNvcnJlY3QgdmFsdWUuICVvIiwKIAkJCSB0ZXJtaW8uY19jZmxhZyk7CiAJ
CWZsYWcrKzsKIAl9CkBAIC0zMDksMTkgKzE1MSwxOCBAQCBzdGF0aWMgaW50IGNoa190dHlfcGFy
bXModm9pZCkKIAogCWZvciAoaSA9IDA7IGkgPCBOQ0M7IGkrKykgewogCQlpZiAoaSA9PSBWRU9M
MikgewotCQkJaWYgKHRlcm1pby5jX2NjW1ZFT0wyXSA9PSBDTlVMKSB7CisJCQlpZiAoIXRlcm1p
by5jX2NjW2ldKSB7CiAJCQkJY29udGludWU7CiAJCQl9IGVsc2UgewotCQkJCXRzdF9yZXNtKFRJ
TkZPLCAiY29udHJvbCBjaGFyICVkIGhhcyAiCi0JCQkJCSAiaW5jb3JyZWN0IHZhbHVlICVkICVk
IiwgaSwKLQkJCQkJIHRlcm1pby5jX2NjW2ldLCBDTlVMKTsKKwkJCQl0c3RfcmVzKFRJTkZPLCAi
Y29udHJvbCBjaGFyICVkIGhhcyAiCisJCQkJCSAiaW5jb3JyZWN0IHZhbHVlICVkIiwgaSwgdGVy
bWlvLmNfY2NbaV0pOwogCQkJCWZsYWcrKzsKIAkJCQljb250aW51ZTsKIAkJCX0KIAkJfQogCiAJ
CWlmICh0ZXJtaW8uY19jY1tpXSAhPSBDU1RBUlQpIHsKLQkJCXRzdF9yZXNtKFRJTkZPLCAiY29u
dHJvbCBjaGFyICVkIGhhcyBpbmNvcnJlY3QgIgorCQkJdHN0X3JlcyhUSU5GTywgImNvbnRyb2wg
Y2hhciAlZCBoYXMgaW5jb3JyZWN0ICIKIAkJCQkgInZhbHVlICVkLiIsIGksIHRlcm1pby5jX2Nj
W2ldKTsKIAkJCWZsYWcrKzsKIAkJfQpAQCAtMzMwLDcgKzE3MSw3IEBAIHN0YXRpYyBpbnQgY2hr
X3R0eV9wYXJtcyh2b2lkKQogCWlmICghCiAJICAgICh0ZXJtaW8uY19sZmxhZwogCSAgICAgJiYg
KElTSUcgfCBJQ0FOT04gfCBYQ0FTRSB8IEVDSE8gfCBFQ0hPRSB8IE5PRkxTSCkpKSB7Ci0JCXRz
dF9yZXNtKFRJTkZPLCAibGZsYWcgaGFzIGluY29ycmVjdCB2YWx1ZS4gJW8iLAorCQl0c3RfcmVz
KFRJTkZPLCAibGZsYWcgaGFzIGluY29ycmVjdCB2YWx1ZS4gJW8iLAogCQkJIHRlcm1pby5jX2xm
bGFnKTsKIAkJZmxhZysrOwogCX0KQEAgLTMzOSwxMzAgKzE4MCw2OCBAQCBzdGF0aWMgaW50IGNo
a190dHlfcGFybXModm9pZCkKIAkgICAgKHRlcm1pby5jX2lmbGFnCiAJICAgICAmJiAoQlJLSU5U
IHwgSUdOUEFSIHwgSU5QQ0sgfCBJU1RSSVAgfCBJQ1JOTCB8IElVQ0xDIHwgSVhPTiB8IElYQU5Z
CiAJCSB8IElYT0ZGKSkpIHsKLQkJdHN0X3Jlc20oVElORk8sICJpZmxhZyBoYXMgaW5jb3JyZWN0
IHZhbHVlLiAlbyIsCisJCXRzdF9yZXMoVElORk8sICJpZmxhZyBoYXMgaW5jb3JyZWN0IHZhbHVl
LiAlbyIsCiAJCQkgdGVybWlvLmNfaWZsYWcpOwogCQlmbGFnKys7CiAJfQogCiAJaWYgKCEodGVy
bWlvLmNfb2ZsYWcgJiYgKE9QT1NUIHwgT0xDVUMgfCBPTkxDUiB8IE9OT0NSKSkpIHsKLQkJdHN0
X3Jlc20oVElORk8sICJvZmxhZyBoYXMgaW5jb3JyZWN0IHZhbHVlLiAlbyIsCisJCXRzdF9yZXMo
VElORk8sICJvZmxhZyBoYXMgaW5jb3JyZWN0IHZhbHVlLiAlbyIsCiAJCQkgdGVybWlvLmNfb2Zs
YWcpOwogCQlmbGFnKys7CiAJfQogCi0JaWYgKCFmbGFnKQotCQl0c3RfcmVzbShUSU5GTywgInRl
cm1pbyB2YWx1ZXMgYXJlIHNldCBhcyBleHBlY3RlZCIpOwotCi0JcmV0dXJuIGZsYWc7Ci19Ci0K
LXN0YXRpYyBpbnQgZG9fcGFyZW50X3NldHVwKHZvaWQpCi17Ci0JaW50IHBmZDsKLQotCXBmZCA9
IFNBRkVfT1BFTihjbGVhbnVwLCBwYXJlbnR0dHksIE9fUkRXUiwgMDc3Nyk7Ci0KLQkvKiB1bnNl
dCB0aGUgY2xvc2VkIGZsYWcgKi8KLQljbG9zZWQgPSAwOwotCi0JLyogZmx1c2ggdHR5IHF1ZXVl
cyB0byByZW1vdmUgb2xkIG91dHB1dCAqLwotCVNBRkVfSU9DVEwoY2xlYW51cCwgcGZkLCBUQ0ZM
U0gsIDIpOwotCXJldHVybiBwZmQ7CisJaWYgKGZsYWcgIT0gMCkKKwkJdHN0X3JlcyhURkFJTCwg
IlRDR0VUQS9UQ1NFVEEgdGVzdHMgRkFJTEVEIHdpdGggIgorCQkJCSIlZCAlcyIsIGZsYWcsIGZs
YWcgPiAxID8gImVycm9ycyIgOiAiZXJyb3IiKTsKKwllbHNlCisJCXRzdF9yZXMoVFBBU1MsICJU
Q0dFVEEvVENTRVRBIHRlc3RzIFNVQ0NFRURFRCIpOwogfQogCiBzdGF0aWMgaW50IGRvX2NoaWxk
X3NldHVwKHZvaWQpCiB7Ci0JaW50IGNmZDsKLQotCWNmZCA9IG9wZW4oY2hpbGR0dHksIE9fUkRX
UiwgMDc3Nyk7Ci0JaWYgKGNmZCA8IDApIHsKLQkJdHN0X3Jlc20oVElORk8sICJDb3VsZCBub3Qg
b3BlbiAlcyBpbiBkb19jaGlsZF9zZXR1cCgpLCBlcnJubyAiCi0JCQkgIj0gJWQiLCBjaGlsZHR0
eSwgZXJybm8pOwotCQkvKiBzaWduYWwgdGhlIHBhcmVudCBzbyB3ZSBkb24ndCBoYW5nIHRoZSB0
ZXN0ICovCi0JCWtpbGwocGFyZW50cGlkLCBTSUdVU1IxKTsKLQkJcmV0dXJuIC0xOwotCX0KKwlp
bnQgY2ZkID0gU0FGRV9PUEVOKGNoaWxkdHR5LCBPX1JEV1IsIDA3NzcpOwogCiAJLyogZmx1c2gg
dHR5IHF1ZXVlcyB0byByZW1vdmUgb2xkIG91dHB1dCAqLwotCWlmIChpb2N0bChjZmQsIFRDRkxT
SCwgMikgPCAwKSB7Ci0JCXRzdF9yZXNtKFRJTkZPLCAiaW9jdGwgVENGTFNIIGZhaWxlZC4gOiBl
cnJubyA9ICVkIiwgZXJybm8pOwotCQkvKiBzaWduYWwgdGhlIHBhcmVudCBzbyB3ZSBkb24ndCBo
YW5nIHRoZSB0ZXN0ICovCi0JCWtpbGwocGFyZW50cGlkLCBTSUdVU1IxKTsKLQkJcmV0dXJuIC0x
OwotCX0KKwlTQUZFX0lPQ1RMKGNmZCwgVENGTFNILCAyKTsKIAogCS8qIHRlbGwgdGhlIHBhcmVu
dCB0aGF0IHdlJ3JlIGRvbmUgKi8KLQlraWxsKHBhcmVudHBpZCwgU0lHVVNSMSk7Ci0KKwlUU1Rf
Q0hFQ0tQT0lOVF9XQUtFKDApOwogCXJldHVybiBjZmQ7CiB9CiAKLS8qCi0gKiBEZWZpbmUgdGhl
IHNpZ25hbHMgaGFuZGxlcnMgaGVyZS4KLSAqLwotc3RhdGljIHZvaWQgc2lndGVybV9oYW5kbGVy
KHZvaWQpCi17Ci0Jc2lndGVybSA9IDE7Ci19Ci0KLXN0YXRpYyB2b2lkIHNpZ3VzcjFfaGFuZGxl
cih2b2lkKQotewotCXNpZ3VzcjEgPSAxOwotfQotCi1zdGF0aWMgdm9pZCBzaWd1c3IyX2hhbmRs
ZXIodm9pZCkKLXsKLQlzaWd1c3IyID0gMTsKLX0KLQotc3RhdGljIHZvaWQgaGVscCh2b2lkKQot
ewotCXByaW50ZigiICAtRCA8dHR5IGRldmljZT4gOiBmb3IgZXhhbXBsZSwgL2Rldi90dHlbMC05
XVxuIik7Ci19Ci0KIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiB7Ci0JaW50IGZkOwotCXN0cnVj
dCBzaWdhY3Rpb24gYWN0OworCWlmICghZGV2aWNlKQorCQl0c3RfYnJrKFRCUk9LLCAiWW91IG11
c3Qgc3BlY2lmeSBhIHR0eSBkZXZpY2Ugd2l0aCAtRCBvcHRpb24iKTsKIAogCS8qIFhYWDogVEVS
Uk5PIHJlcXVpcmVkIGFsbCBvdmVyIHRoZSBwbGFjZSAqLwotCWZkID0gU0FGRV9PUEVOKE5VTEws
IGRldm5hbWUsIE9fUkRXUiwgMDc3Nyk7CisJaW50IGZkID0gU0FGRV9PUEVOKGRldmljZSwgT19S
RFdSLCAwNzc3KTsKIAogCS8qIFNhdmUgdGhlIGN1cnJlbnQgZGV2aWNlIGluZm9ybWF0aW9uIC0g
dG8gYmUgcmVzdG9yZWQgaW4gY2xlYW51cCgpICovCi0JU0FGRV9JT0NUTChjbGVhbnVwLCBmZCwg
VENHRVRBLCAmc2F2ZV9pbyk7CisJU0FGRV9JT0NUTChmZCwgVENHRVRBLCAmc2F2ZV9pbyk7CiAK
IAkvKiBDbG9zZSB0aGUgZGV2aWNlICovCi0JU0FGRV9DTE9TRShjbGVhbnVwLCBmZCk7Ci0KLQkv
KiBTZXQgdXAgdGhlIHNpZ25hbCBoYW5kbGVycyAqLwotCWFjdC5zYV9oYW5kbGVyID0gKHZvaWQg
KilzaWd0ZXJtX2hhbmRsZXI7Ci0JYWN0LnNhX2ZsYWdzID0gMDsKLQlzaWdlbXB0eXNldCgmYWN0
LnNhX21hc2spOwotCSh2b2lkKXNpZ2FjdGlvbihTSUdURVJNLCAmYWN0LCAwKTsKLQotCWFjdC5z
YV9oYW5kbGVyID0gKHZvaWQgKilzaWd1c3IxX2hhbmRsZXI7Ci0JYWN0LnNhX2ZsYWdzID0gMDsK
LQkodm9pZClzaWdhY3Rpb24oU0lHVVNSMSwgJmFjdCwgMCk7Ci0KLQlhY3Quc2FfaGFuZGxlciA9
ICh2b2lkICopc2lndXNyMl9oYW5kbGVyOwotCWFjdC5zYV9mbGFncyA9IDA7Ci0JKHZvaWQpc2ln
YWN0aW9uKFNJR1VTUjIsICZhY3QsIDApOwotCi0JYWN0LnNhX2hhbmRsZXIgPSBTSUdfSUdOOwot
CWFjdC5zYV9mbGFncyA9IDA7Ci0JKHZvaWQpc2lnYWN0aW9uKFNJR1RUT1UsICZhY3QsIDApOwot
Ci0Jc2lndGVybSA9IHNpZ3VzcjEgPSBzaWd1c3IyID0gMDsKLQotCVRFU1RfUEFVU0U7CisJU0FG
RV9DTE9TRShmZCk7CiB9CiAKIHN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKIHsKLQlpZiAoIWNs
b3NlZCkgewotCQlpZiAoaW9jdGwocGFyZW50ZmQsIFRDU0VUQSwgJnNhdmVfaW8pID09IC0xKQot
CQkJdHN0X3Jlc20oVElORk8sICJpb2N0bCByZXN0b3JlIGZhaWxlZCBpbiBjbGVhbnVwKCkiKTsK
LQkJaWYgKGNsb3NlKHBhcmVudGZkKSA9PSAtMSkKLQkJCXRzdF9yZXNtKFRJTkZPLCAiY2xvc2Uo
KSBmYWlsZWQgaW4gY2xlYW51cCgpIik7CisJaWYgKHBhcmVudGZkID49IDApIHsKKwkJU0FGRV9J
T0NUTChwYXJlbnRmZCwgVENTRVRBLCAmc2F2ZV9pbyk7CisJCVNBRkVfQ0xPU0UocGFyZW50ZmQp
OwogCX0KIH0KKworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0geworCS5uZWVkc19yb290
ID0gMSwKKwkubmVlZHNfY2hlY2twb2ludHMgPSAxLAorCS5mb3Jrc19jaGlsZCA9IDEsCisJLnNl
dHVwID0gc2V0dXAsCisJLmNsZWFudXAgPSBjbGVhbnVwLAorCS50ZXN0X2FsbCA9IHZlcmlmeV9p
b2N0bCwKKwkub3B0aW9ucyA9IChzdHJ1Y3QgdHN0X29wdGlvbltdKSB7CisJCXsiRDoiLCAmZGV2
aWNlLCAiVHR5IGRldmljZS4gRm9yIGV4YW1wbGUsIC9kZXYvdHR5WzAtOV0ifSwKKwkJe30KKwl9
Cit9OwpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKLS0gCjIuNDIuMAoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
