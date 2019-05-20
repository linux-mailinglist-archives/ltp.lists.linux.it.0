Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9188E23A0E
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 16:31:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CF8B2987AB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 16:31:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 19150298791
 for <ltp@lists.linux.it>; Mon, 20 May 2019 16:31:41 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C2E126018DF
 for <ltp@lists.linux.it>; Mon, 20 May 2019 16:31:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32D21AF0F
 for <ltp@lists.linux.it>; Mon, 20 May 2019 14:31:37 +0000 (UTC)
Date: Mon, 20 May 2019 16:31:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190520143135.GA27341@dell5510>
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506201948.GA9828@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
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

SGkgQ2hyaXN0aWFuLCBDeXJpbCwKCkJlZm9yZSBhcHBseWluZyAod2l0aCBmb2xsb3dpbmcgZGlm
ZiksIGp1c3QgMiBxdWVzdGlvbnM6CgouL2NvcHlfZmlsZV9yYW5nZTAyCnRzdF90ZXN0LmM6MTA5
NjogSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAwMHMKY29weV9maWxlX3JhbmdlLmg6
MzA6IElORk86IFRlc3RpbmcgbGliYyBjb3B5X2ZpbGVfcmFuZ2UoKQpjb3B5X2ZpbGVfcmFuZ2Uu
aDo0NzogQ09ORjogbGliYyBjb3B5X2ZpbGVfcmFuZ2UoKSBub3Qgc3VwcG9ydGVkIQoxKSBJIGtu
b3cgSSB3YXMgdGhlIG9uZSB3aG8gYXNrZWQgdG8gdXNlIC50ZXN0X3ZhcmlhbnRzLCBidXQgaXQg
cHJvYmFibHkgZG9lcwpub3QgbWFrZSBzZW5zZSB0byB1c2UgaXQgdW50aWwgZ2xpYmMgKG9yIHNv
bWUgb3RoZXIgbGliYykgYWRkcyBjb3B5X2ZpbGVfcmFuZ2UoKQp3cmFwcGVyLgoKdHN0X3Rlc3Qu
YzoxMDk2OiBJTkZPOiBUaW1lb3V0IHBlciBydW4gaXMgMGggMDVtIDAwcwpjb3B5X2ZpbGVfcmFu
Z2UuaDozMzogSU5GTzogVGVzdGluZyB0c3QgY29weV9maWxlX3JhbmdlKCkKY29weV9maWxlX3Jh
bmdlMDEuYzoxOTQ6IFBBU1M6IGNvcHlfZmlsZV9yYW5nZSBjb21wbGV0ZWQgYWxsIDE0NCBjb3B5
IGpvYnMgc3VjY2Vzc2Z1bGx5IQoKCgoyKSBHbGliYyBhZGRzIGludGVybmFsIGltcGxlbWVudGF0
aW9uIG9mIGNvcHlfZmlsZV9yYW5nZSgpLCB1c2VkIGFzIGZhbGxiYWNrCndoZW4ga2VybmVsIDwg
NC41ICh3aGljaCBicm91Z2h0IGNvcHlfZmlsZV9yYW5nZSgpKSBbMV0uIEkgZ3Vlc3MgdGhlcmUg
aXMgbm8gd2F5CnRvIHVzZSBpdCBleHBsaWNpdGx5IDooLgoKS2luZCByZWdhcmRzLApQZXRyCgpb
MV0gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9Z2xpYmMuZ2l0O2E9Y29tbWl0ZGlmZjto
PWJhZDdhMGM4MWY1MDFmYmJjYzc5YWY5ZWFhNGI4MjU0NDQxYzRhMWY7aHA9NmNiODZmZDIxY2E2
ZmRmYzMxMDQyY2RhOGMzN2Y5NmM0NmI4YTRkYQoKZGlmZiAtLWdpdCBjb25maWd1cmUuYWMgY29u
ZmlndXJlLmFjCmluZGV4IDFkODI1ZGMxZS4uNWRjODU3MjhhIDEwMDY0NAotLS0gY29uZmlndXJl
LmFjCisrKyBjb25maWd1cmUuYWMKQEAgLTYwLDYgKzYwLDcgQEAgQUNfQ0hFQ0tfSEVBREVSUyhb
IFwKIF0pCiAKIEFDX0NIRUNLX0ZVTkNTKFsgXAorICAgIGNvcHlfZmlsZV9yYW5nZSBcCiAgICAg
ZXBvbGxfcHdhaXQgXAogICAgIGV4ZWN2ZWF0IFwKICAgICBmYWxsb2NhdGUgXApAQCAtMTk4LDcg
KzE5OSw2IEBAIExUUF9DSEVDS19CVUlMVElOX0NMRUFSX0NBQ0hFCiBMVFBfQ0hFQ0tfQ0FQQUJJ
TElUWV9TVVBQT1JUCiBMVFBfQ0hFQ0tfQ0NfV0FSTl9PTERTVFlMRQogTFRQX0NIRUNLX0NMT05F
X1NVUFBPUlRTXzdfQVJHUwotTFRQX0NIRUNLX0NPUFlfRklMRV9SQU5HRQogTFRQX0NIRUNLX0NS
WVBUTwogTFRQX0NIRUNLX0ZJREVEVVBFCiBMVFBfQ0hFQ0tfRk9SVElGWV9TT1VSQ0UKZGlmZiAt
LWdpdCBtNC9sdHAtY29weV9maWxlX3JhbmdlLm00IG00L2x0cC1jb3B5X2ZpbGVfcmFuZ2UubTQK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDJkODdlODkwMC4uMDAwMDAwMDAwCi0tLSBt
NC9sdHAtY29weV9maWxlX3JhbmdlLm00CisrKyAvZGV2L251bGwKQEAgLTEsNyArMCwwIEBACi1k
bmwgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKLWRubCBDb3B5cmln
aHQgKGMpIDIwMTkgU1VTRSBMTEMKLWRubCBBdXRob3I6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5u
QHN1c2UuY29tPgotCi1BQ19ERUZVTihbTFRQX0NIRUNLX0NPUFlfRklMRV9SQU5HRV0sWwotQUNf
Q0hFQ0tfRlVOQ1MoY29weV9maWxlX3JhbmdlLCwpCi1dKQpkaWZmIC0tZ2l0IHRlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZS5oIHRlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZS5oCmluZGV4
IGQyZWYxMzQ4Yi4uYjZkMTMyOTc4IDEwMDY0NAotLS0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlLmgKKysrIHRlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZS5oCkBAIC00NCw3ICs0NCw3
IEBAIHN0YXRpYyBpbnQgc3lzX2NvcHlfZmlsZV9yYW5nZShpbnQgZmRfaW4sIGxvZmZfdCAqb2Zm
X2luLAogCQlyZXR1cm4gY29weV9maWxlX3JhbmdlKGZkX2luLCBvZmZfaW4sCiAJCQkJZmRfb3V0
LCBvZmZfb3V0LCBsZW4sIGZsYWdzKTsKICNlbHNlCi0JCXRzdF9icmsoVENPTkYsICJsaWJjIGNv
cHlfZmlsZV9yYW5nZSgpIG5vdCBzdXBwb3J0ZWQhIik7CisJCXRzdF9icmsoVENPTkYsICJsaWJj
IGNvcHlfZmlsZV9yYW5nZSgpIG5vdCBzdXBwb3J0ZWQiKTsKICNlbmRpZgogCQlicmVhazsKIAlj
YXNlIDE6CmRpZmYgLS1naXQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFu
Z2UvY29weV9maWxlX3JhbmdlMDMuYyB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2NvcHlfZmls
ZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMy5jCmluZGV4IDE4ZTQxMWFmMi4uMjUzZWI1N2FkIDEw
MDY0NAotLS0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9m
aWxlX3JhbmdlMDMuYworKysgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFu
Z2UvY29weV9maWxlX3JhbmdlMDMuYwpAQCAtNDUsNyArNDUsNyBAQCBzdGF0aWMgdm9pZCB2ZXJp
ZnlfY29weV9maWxlX3JhbmdlX3RpbWVzdGFtcCh2b2lkKQogCWlmICh0aW1lc3RhbXAgPT0gdXBk
YXRlZF90aW1lc3RhbXApCiAJCXRzdF9icmsoVEZBSUwsICJjb3B5X2ZpbGVfcmFuZ2UgZGlkIG5v
dCB1cGRhdGUgdGltZXN0YW1wLiIpOwogCi0JdHN0X3JlcyhUUEFTUywgImNvcHlfZmlsZV9yYW5n
ZSBzdWNlc3NmdWxseSB1cGRhdGVkIHRoZSB0aW1lc3RhbXAhIik7CisJdHN0X3JlcyhUUEFTUywg
ImNvcHlfZmlsZV9yYW5nZSBzdWNlc3NmdWxseSB1cGRhdGVkIHRoZSB0aW1lc3RhbXAiKTsKIH0K
IAogc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
