Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86036F4A
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 11:00:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF7523EAA3D
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 11:00:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6766C29879C
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 11:00:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E28C91000DB9
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 11:00:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AA7DEAD56
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 09:00:12 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Thu,  6 Jun 2019 11:00:08 +0200
Message-Id: <20190606090009.31124-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/fstat{01,02}: rewrote testcases
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

TWVyZ2VkIHRoZSB0d28gdGVzdHM6Cglmc3RhdDAxIGlzIGEgc3Vic2V0IG9mIGZzdGF0MDIgYW5k
IGlzIHRoZXJlZm9yZSBub3QgbmVlZGVkCglhbnltb3JlLgpSZXdyb3RlIHRlc3RjYXNlOgoJQ2xl
YW5lZCB1cCBhbmQgcG9ydGVkIHRvIG5ldyBsaWJyYXJ5LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEFtYW5uIDxjYW1hbm5Ac3VzZS5jb20+Ci0tLQoKTm90ZXM6CiAgICBSZW1vdmVkIHRlc3Qg
Zm9yIHJhdyBmc3RhdCBzeXNjYWxsOgogICAgQ2FsbGluZyB0aGUgcmF3IHN5c2NhbGwgb24gYSBn
bGliYyBwcm92aWRlZCBzdGF0IHN0cnVjdCBvbiBhCiAgICAzMiBiaXQgc3lzdGVtIGNhdXNlZCBl
aXRoZXIgYW4gb3ZlcmZsb3cgb2YgdGhlIHN0cnVjdHVyZSBvcgogICAgdGhlIHZhbHVlcyB3ZXJl
IHdyb25nIGR1ZSB0byB0aGVtIGhhdmluZyBhIGJpZ2dlciBzaXplIHRoYW4gdGhlCiAgICBzeXNj
YWxscyBhbnRpY2lwYXRlZCAodGVzdGVkIGFsbCB0aHJlZTogb2xkZnN0YXQvZnN0YXQvZnN0YXQ2
NCkuCiAgICBCeSBwcm92aWRpbmcgY3VzdG9tIHN0YXQgc3RydWN0cyBJIHdvdWxkIGhhdmUgdG8g
bWFrZSBzdXJlIHRoZXkKICAgIHdvcmsgb24gYWxsIGFyY2hpdGVjdHVyZXMgKHNhbWUgYXMgZ2xp
YmMgZG9lcykuIEkgZGVjaWRlZCB0bwogICAgcmVtb3ZlIHRoaXMgdGVzdCB2YXJpYW50IGJlY2F1
c2UgSSBjb3VsZG4ndCBndWFyYW50ZWUKICAgIHRoaXMuCgogcnVudGVzdC9zeXNjYWxscyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyIC0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
ZnN0YXQvLmdpdGlnbm9yZSB8ICAgMiAtCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0
L2ZzdGF0MDEuYyAgfCAxNzUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHRlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQvZnN0YXQwMi5jICB8IDE0NCArKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMjgwIGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQv
ZnN0YXQwMS5jCgpkaWZmIC0tZ2l0IGEvcnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qvc3lzY2Fs
bHMKaW5kZXggNzYyYjE1YjFmLi42ZDg1ZjliYjcgMTAwNjQ0Ci0tLSBhL3J1bnRlc3Qvc3lzY2Fs
bHMKKysrIGIvcnVudGVzdC9zeXNjYWxscwpAQCAtMzMyLDggKzMzMiw2IEBAIGZwYXRoY29uZjAx
IGZwYXRoY29uZjAxCiBmcmVtb3ZleGF0dHIwMSBmcmVtb3ZleGF0dHIwMQogZnJlbW92ZXhhdHRy
MDIgZnJlbW92ZXhhdHRyMDIKIAotZnN0YXQwMSBmc3RhdDAxCi1mc3RhdDAxXzY0IGZzdGF0MDFf
NjQKIGZzdGF0MDIgZnN0YXQwMgogZnN0YXQwMl82NCBmc3RhdDAyXzY0CiBmc3RhdDAzIGZzdGF0
MDMKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQvLmdpdGlnbm9y
ZSBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQvLmdpdGlnbm9yZQppbmRleCBjZjUy
MDVkNDQuLjFjNjZiZGYxMCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9m
c3RhdC8uZ2l0aWdub3JlCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQvLmdp
dGlnbm9yZQpAQCAtMSw1ICsxLDMgQEAKLS9mc3RhdDAxCi0vZnN0YXQwMV82NAogL2ZzdGF0MDIK
IC9mc3RhdDAyXzY0CiAvZnN0YXQwMwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9mc3RhdC9mc3RhdDAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0L2Zz
dGF0MDEuYwpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTU5NDBjNjI3Li4wMDAwMDAw
MDAKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mc3RhdC9mc3RhdDAxLmMKKysrIC9k
ZXYvbnVsbApAQCAtMSwxNzUgKzAsMCBAQAotLyoKLSAqIENvcHlyaWdodCAoYykgMjAwMCBTaWxp
Y29uIEdyYXBoaWNzLCBJbmMuICBBbGwgUmlnaHRzIFJlc2VydmVkLgotICoKLSAqIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9k
aWZ5IGl0Ci0gKiB1bmRlciB0aGUgdGVybXMgb2YgdmVyc2lvbiAyIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcwotICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd291bGQgYmUgdXNlZnVsLCBidXQKLSAqIFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3
aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSAqIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KLSAqCi0gKiBGdXJ0aGVyLCB0aGlz
IHNvZnR3YXJlIGlzIGRpc3RyaWJ1dGVkIHdpdGhvdXQgYW55IHdhcnJhbnR5IHRoYXQgaXQgaXMK
LSAqIGZyZWUgb2YgdGhlIHJpZ2h0ZnVsIGNsYWltIG9mIGFueSB0aGlyZCBwZXJzb24gcmVnYXJk
aW5nIGluZnJpbmdlbWVudAotICogb3IgdGhlIGxpa2UuICBBbnkgbGljZW5zZSBwcm92aWRlZCBo
ZXJlaW4sIHdoZXRoZXIgaW1wbGllZCBvcgotICogb3RoZXJ3aXNlLCBhcHBsaWVzIG9ubHkgdG8g
dGhpcyBzb2Z0d2FyZSBmaWxlLiAgUGF0ZW50IGxpY2Vuc2VzLCBpZgotICogYW55LCBwcm92aWRl
ZCBoZXJlaW4gZG8gbm90IGFwcGx5IHRvIGNvbWJpbmF0aW9ucyBvZiB0aGlzIHByb2dyYW0gd2l0
aAotICogb3RoZXIgc29mdHdhcmUsIG9yIGFueSBvdGhlciBwcm9kdWN0IHdoYXRzb2V2ZXIuCi0g
KgotICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYWxvbmcKLSAqIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRl
IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCi0gKiA1MSBGcmFua2xpbiBTdHJl
ZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgotICoKLSAqIENvbnRh
Y3QgaW5mb3JtYXRpb246IFNpbGljb24gR3JhcGhpY3MsIEluYy4sIDE2MDAgQW1waGl0aGVhdHJl
IFBrd3ksCi0gKiBNb3VudGFpbiBWaWV3LCBDQSAgOTQwNDMsIG9yOgotICoKLSAqIGh0dHA6Ly93
d3cuc2dpLmNvbQotICoKLSAqIEZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIHJlZ2FyZGluZyB0aGlz
IG5vdGljZSwgc2VlOgotICoKLSAqIGh0dHA6Ly9vc3Muc2dpLmNvbS9wcm9qZWN0cy9HZW5JbmZv
L05vdGljZUV4cGxhbi8KLSAqCi0gKi8KLS8qICRJZDogZnN0YXQwMS5jLHYgMS42IDIwMDkvMDgv
MjggMTI6NTE6MzQgdmFwaWVyIEV4cCAkICovCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgotICoKLSAqICAgIE9TIFRlc3QgLSBTaWxp
Y29uIEdyYXBoaWNzLCBJbmMuCi0gKgotICogICAgVEVTVCBJREVOVElGSUVSCTogZnN0YXQwMQot
ICoKLSAqICAgIEVYRUNVVEVEIEJZCTogYW55b25lCi0gKgotICogICAgVEVTVCBUSVRMRQk6IEJh
c2ljIHRlc3QgZm9yIGZzdGF0KDIpCi0gKgotICogICAgUEFSRU5UIERPQ1VNRU5UCTogdXNjdHBs
MDEKLSAqCi0gKiAgICBURVNUIENBU0UgVE9UQUwJOiAxCi0gKgotICogICAgV0FMTCBDTE9DSyBU
SU1FCTogMQotICoKLSAqICAgIENQVSBUWVBFUwkJOiBBTEwKLSAqCi0gKiAgICBBVVRIT1IJCTog
V2lsbGlhbSBSb3NrZQotICoKLSAqICAgIENPLVBJTE9UCQk6IERhdmUgRmVubmVyCi0gKgotICog
ICAgREFURSBTVEFSVEVECTogMDMvMzAvOTIKLSAqCi0gKiAgICBJTklUSUFMIFJFTEVBU0UJOiBV
TklDT1MgNy4wCi0gKgotICogICAgVEVTVCBDQVNFUwotICoKLSAqCTEuKSBmc3RhdCgyKSByZXR1
cm5zLi4uKFNlZSBEZXNjcmlwdGlvbikKLSAqCi0gKiAgICBJTlBVVCBTUEVDSUZJQ0FUSU9OUwot
ICoJVGhlIHN0YW5kYXJkIG9wdGlvbnMgZm9yIHN5c3RlbSBjYWxsIHRlc3RzIGFyZSBhY2NlcHRl
ZC4KLSAqCShTZWUgdGhlIHBhcnNlX29wdHMoMykgbWFuIHBhZ2UpLgotICoKLSAqICAgIE9VVFBV
VCBTUEVDSUZJQ0FUSU9OUwotICoKLSAqICAgIERVUkFUSU9OCi0gKglUZXJtaW5hdGVzIC0gd2l0
aCBmcmVxdWVuY3kgYW5kIGluZmluaXRlIG1vZGVzLgotICoKLSAqICAgIFNJR05BTFMKLSAqCVVz
ZXMgU0lHVVNSMSB0byBwYXVzZSBiZWZvcmUgdGVzdCBpZiBvcHRpb24gc2V0LgotICoJKFNlZSB0
aGUgcGFyc2Vfb3B0cygzKSBtYW4gcGFnZSkuCi0gKgotICogICAgUkVTT1VSQ0VTCi0gKglOb25l
Ci0gKgotICogICAgRU5WSVJPTk1FTlRBTCBORUVEUwotICogICAgICBObyBydW4tdGltZSBlbnZp
cm9ubWVudGFsIG5lZWRzLgotICoKLSAqICAgIFNQRUNJQUwgUFJPQ0VEVVJBTCBSRVFVSVJFTUVO
VFMKLSAqCU5vbmUKLSAqCi0gKiAgICBJTlRFUkNBU0UgREVQRU5ERU5DSUVTCi0gKglOb25lCi0g
KgotICogICAgREVUQUlMRUQgREVTQ1JJUFRJT04KLSAqCVRoaXMgaXMgYSBQaGFzZSBJIHRlc3Qg
Zm9yIHRoZSBmc3RhdCgyKSBzeXN0ZW0gY2FsbC4gIEl0IGlzIGludGVuZGVkCi0gKgl0byBwcm92
aWRlIGEgbGltaXRlZCBleHBvc3VyZSBvZiB0aGUgc3lzdGVtIGNhbGwsIGZvciBub3cuICBJdAot
ICoJc2hvdWxkL3dpbGwgYmUgZXh0ZW5kZWQgd2hlbiBmdWxsIGZ1bmN0aW9uYWwgdGVzdHMgYXJl
IHdyaXR0ZW4gZm9yCi0gKglmc3RhdCgyKS4KLSAqCi0gKglTZXR1cDoKLSAqCSAgU2V0dXAgc2ln
bmFsIGhhbmRsaW5nLgotICoJICBQYXVzZSBmb3IgU0lHVVNSMSBpZiBvcHRpb24gc3BlY2lmaWVk
LgotICoKLSAqCVRlc3Q6Ci0gKgkgTG9vcCBpZiB0aGUgcHJvcGVyIG9wdGlvbnMgYXJlIGdpdmVu
LgotICoJICBFeGVjdXRlIHN5c3RlbSBjYWxsCi0gKgkgIENoZWNrIHJldHVybiBjb2RlLCBpZiBz
eXN0ZW0gY2FsbCBmYWlsZWQgKHJldHVybj0tMSkKLSAqCQlMb2cgdGhlIGVycm5vIGFuZCBJc3N1
ZSBhIEZBSUwgbWVzc2FnZS4KLSAqCSAgT3RoZXJ3aXNlLCBJc3N1ZSBhIFBBU1MgbWVzc2FnZS4K
LSAqCi0gKglDbGVhbnVwOgotICoJICBQcmludCBlcnJubyBsb2cgYW5kL29yIHRpbWluZyBzdGF0
cyBpZiBvcHRpb25zIGdpdmVuCi0gKgotICoKLSAqIyojKiMqIyojKiMqIyojKiMqIyojKiMqIyoj
KiMqIyojKiMqIyojKiMqIyojKiMqIyojKiMqIyojKiovCi0KLSNpbmNsdWRlIDxzeXMvdHlwZXMu
aD4KLSNpbmNsdWRlIDxmY250bC5oPgotI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Ci0jaW5jbHVkZSA8
ZXJybm8uaD4KLSNpbmNsdWRlIDxzdHJpbmcuaD4KLSNpbmNsdWRlIDxzaWduYWwuaD4KLSNpbmNs
dWRlICJ0ZXN0LmgiCi0jaW5jbHVkZSAic2FmZV9tYWNyb3MuaCIKLQotdm9pZCBzZXR1cCgpOwot
dm9pZCBjbGVhbnVwKCk7Ci0KLWNoYXIgKlRDSUQgPSAiZnN0YXQwMSI7Ci1pbnQgVFNUX1RPVEFM
ID0gMTsKLQotY2hhciBmbmFtZVsyNTVdOwotaW50IGZkOwotc3RydWN0IHN0YXQgc3RhdHRlcjsK
LQotaW50IG1haW4oaW50IGFjLCBjaGFyICoqYXYpCi17Ci0JaW50IGxjOwotCi0JdHN0X3BhcnNl
X29wdHMoYWMsIGF2LCBOVUxMLCBOVUxMKTsKLQotCXNldHVwKCk7Ci0KLQlmb3IgKGxjID0gMDsg
VEVTVF9MT09QSU5HKGxjKTsgbGMrKykgewotCi0JCXRzdF9jb3VudCA9IDA7Ci0KLQkJVEVTVChm
c3RhdChmZCwgJnN0YXR0ZXIpKTsKLQotCQlpZiAoVEVTVF9SRVRVUk4gPT0gLTEpCi0JCQl0c3Rf
cmVzbShURkFJTCB8IFRURVJSTk8sICJmc3RhdCBmYWlsZWQiKTsKLQkJZWxzZQotCQkJdHN0X3Jl
c20oVFBBU1MsICJmc3RhdCByZXR1cm5lZCAlbGQiLCBURVNUX1JFVFVSTik7Ci0JfQotCi0JY2xl
YW51cCgpOwotCXRzdF9leGl0KCk7Ci19Ci0KLXZvaWQgc2V0dXAodm9pZCkKLXsKLQotCXRzdF9z
aWcoTk9GT1JLLCBERUZfSEFORExFUiwgY2xlYW51cCk7Ci0KLQlURVNUX1BBVVNFOwotCi0JdHN0
X3RtcGRpcigpOwotCi0Jc3ByaW50ZihmbmFtZSwgInRmaWxlXyVkIiwgZ2V0cGlkKCkpOwotCWZk
ID0gU0FGRV9PUEVOKGNsZWFudXAsIGZuYW1lLCBPX1JEV1IgfCBPX0NSRUFULCAwNzAwKTsKLX0K
LQotdm9pZCBjbGVhbnVwKHZvaWQpCi17Ci0JaWYgKGNsb3NlKGZkKSA9PSAtMSkKLQkJdHN0X3Jl
c20oVFdBUk4gfCBURVJSTk8sICJjbG9zZSglcykgZmFpbGVkIiwgZm5hbWUpOwotCi0JdHN0X3Jt
ZGlyKCk7Ci0KLX0KZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQv
ZnN0YXQwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mc3RhdC9mc3RhdDAyLmMKaW5k
ZXggMjFlZjE2NjE3Li5hZWNlZWZlMzYgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZnN0YXQvZnN0YXQwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0
YXQvZnN0YXQwMi5jCkBAIC0xLDE1MiArMSw5NCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb3ItbGF0ZXIKIC8qCiAgKiBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwg
QnVzaW5lc3MgTWFjaGluZXMgIENvcnAuLCAyMDAxCiAgKiAgMDcvMjAwMSBQb3J0ZWQgYnkgV2F5
bmUgQm95ZXIKLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgIHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKLSAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Ci0gKiB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBv
cgotICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KLSAqCi0gKiBUaGlzIHBy
b2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwK
LSAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgIHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3
YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlCi0gKiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1v
cmUgZGV0YWlscy4KLSAqCi0gKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQotICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07
ICBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sCi0gKiBJbmMu
LCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEg
VVNBCisgKiAgMDUvMjAxOSBQb3J0ZWQgdG8gbmV3IGxpYnJhcnk6IENocmlzdGlhbiBBbWFubiA8
Y2FtYW5uQHN1c2UuY29tPgogICovCiAvKgotICogZnN0YXQoKSBzaG91bGQgcmV0dXJuIHZhbHVl
IDAgb24gc3VjY2VzcyBhbmQgdGhlIHN0YXQgc3RydWN0dXJlIGVsZW1lbnRzCi0gKiBzaG91bGQg
YmUgZmlsbGVkIHdpdGggc3BlY2lmaWVkICdmaWxlJyBpbmZvcm1hdGlvbi4KKyAqIFRlc3RzIGlm
IGZzdGF0KCkgcmV0dXJucyBjb3JyZWN0bHkgYW5kIHJlcG9ydHMgY29ycmVjdCBmaWxlIGluZm9y
bWF0aW9uCisgKiB1c2luZyB0aGUgc3RhdCBzdHJ1Y3R1cmUuCiAgKi8KLSNpbmNsdWRlIDxzdGRp
by5oPgotI2luY2x1ZGUgPHN5cy90eXBlcy5oPgotI2luY2x1ZGUgPGZjbnRsLmg+Ci0jaW5jbHVk
ZSA8c3lzL3N0YXQuaD4KLSNpbmNsdWRlIDxlcnJuby5oPgotI2luY2x1ZGUgPHN0cmluZy5oPgot
I2luY2x1ZGUgPHNpZ25hbC5oPgotI2luY2x1ZGUgPHB3ZC5oPgogCi0jaW5jbHVkZSAidGVzdC5o
IgotI2luY2x1ZGUgInNhZmVfbWFjcm9zLmgiCisjaW5jbHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRl
IDx1bmlzdGQuaD4KKyNpbmNsdWRlIDxzeXMvc3RhdC5oPgorI2luY2x1ZGUgPHN5cy90eXBlcy5o
PgorI2luY2x1ZGUgInRzdF90ZXN0LmgiCisjaW5jbHVkZSAidHN0X3NhZmVfbWFjcm9zLmgiCiAK
LSNkZWZpbmUgRklMRV9NT0RFCTA2NDQKLSNkZWZpbmUgVEVTVEZJTEUJInRlc3RmaWxlIgorI2Rl
ZmluZSBURVNURklMRSAgICAgICAgInRlc3RfZmlsZSIKICNkZWZpbmUgRklMRV9TSVpFICAgICAg
IDEwMjQKLSNkZWZpbmUgQlVGX1NJWkUJMjU2Ci0jZGVmaW5lIE1BU0sJCTA3NzcKKyNkZWZpbmUg
RklMRV9NT0RFCTA2NDQKIAotY2hhciAqVENJRCA9ICJmc3RhdDAyIjsKLWludCBUU1RfVE9UQUwg
PSAxOworc3RhdGljIHN0cnVjdCBzdGF0IHN0YXRfYnVmOwogc3RhdGljIHVpZF90IHVzZXJfaWQ7
CiBzdGF0aWMgZ2lkX3QgZ3JvdXBfaWQ7CiBzdGF0aWMgaW50IGZpbGRlczsKIAotc3RhdGljIHZv
aWQgc2V0dXAodm9pZCk7Ci1zdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpOwotCi1zdGF0aWMgdm9p
ZCB2ZXJpZnkodm9pZCkKK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQogewotCXN0cnVjdCBzdGF0IHN0
YXRfYnVmOwotCWludCBmYWlsID0gMDsKKwlpbnQgZmFpbDsKIAogCVRFU1QoZnN0YXQoZmlsZGVz
LCAmc3RhdF9idWYpKTsKIAotCWlmIChURVNUX1JFVFVSTiA9PSAtMSkgewotCQl0c3RfcmVzbShU
RkFJTCB8IFRURVJSTk8sICJmc3RhdCglcykgZmFpbGVkIiwgVEVTVEZJTEUpOworCWlmIChUU1Rf
UkVUID09IC0xKSB7CisJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAiZnN0YXQoKSBmYWlsZWQi
KTsKIAkJcmV0dXJuOwogCX0KIAorCWZhaWwgPSAwOwogCWlmIChzdGF0X2J1Zi5zdF91aWQgIT0g
dXNlcl9pZCkgewotCQl0c3RfcmVzbShUSU5GTywgInN0YXRfYnVmLnN0X3VpZCA9ICVpIGV4cGVj
dGVkICVpIiwKLQkJICAgICAgICAgc3RhdF9idWYuc3RfdWlkLCB1c2VyX2lkKTsKKwkJdHN0X3Jl
cyhURkFJTCwgInN0YXRfYnVmLnN0X3VpZCA9ICVpIGV4cGVjdGVkICVpIiwKKwkJCXN0YXRfYnVm
LnN0X3VpZCwgdXNlcl9pZCk7CiAJCWZhaWwrKzsKIAl9CiAKIAlpZiAoc3RhdF9idWYuc3RfZ2lk
ICE9IGdyb3VwX2lkKSB7Ci0JCXRzdF9yZXNtKFRJTkZPLCAic3RhdF9idWYuc3RfZ2lkID0gJWkg
ZXhwZWN0ZWQgJWkiLAotCQkgICAgICAgICBzdGF0X2J1Zi5zdF9naWQsIGdyb3VwX2lkKTsKKwkJ
dHN0X3JlcyhURkFJTCwgInN0YXRfYnVmLnN0X2dpZCA9ICVpIGV4cGVjdGVkICVpIiwKKwkJCXN0
YXRfYnVmLnN0X2dpZCwgZ3JvdXBfaWQpOwogCQlmYWlsKys7CiAJfQogCiAJaWYgKHN0YXRfYnVm
LnN0X3NpemUgIT0gRklMRV9TSVpFKSB7Ci0JCXRzdF9yZXNtKFRJTkZPLCAic3RhdF9idWYuc3Rf
c2l6ZSA9ICVsaSBleHBlY3RlZCAlaSIsCi0JCSAgICAgICAgIChsb25nKXN0YXRfYnVmLnN0X3Np
emUsIEZJTEVfU0laRSk7CisJCXRzdF9yZXMoVEZBSUwsICJzdGF0X2J1Zi5zdF9zaXplID0gJWxp
IGV4cGVjdGVkICVpIiwKKwkJCShsb25nKXN0YXRfYnVmLnN0X3NpemUsIEZJTEVfU0laRSk7CiAJ
CWZhaWwrKzsKIAl9CiAKLSAgICAgICAgaWYgKChzdGF0X2J1Zi5zdF9tb2RlICYgTUFTSykgIT0g
RklMRV9NT0RFKSB7Ci0JCXRzdF9yZXNtKFRJTkZPLCAic3RhdF9idWYuc3RfbW9kZSA9ICVvIGV4
cGVjdGVkICVvIiwKLQkJICAgICAgICAgKHN0YXRfYnVmLnN0X21vZGUgJiBNQVNLKSwgRklMRV9N
T0RFKTsKKwlpZiAoKHN0YXRfYnVmLnN0X21vZGUgJiAwNzc3KSAhPSBGSUxFX01PREUpIHsKKwkJ
dHN0X3JlcyhURkFJTCwgInN0YXRfYnVmLnN0X21vZGUgPSAlbyBleHBlY3RlZCAlbyIsCisJCQko
c3RhdF9idWYuc3RfbW9kZSAmIDA3NzcpLCBGSUxFX01PREUpOwogCQlmYWlsKys7CiAJfQogCiAJ
aWYgKGZhaWwpIHsKLQkJdHN0X3Jlc20oVEZBSUwsICJmdW5jdGlvbmFsaXR5IG9mIGZzdGF0IGlu
Y29ycmVjdCIpOworCQl0c3RfcmVzKFRGQUlMLCAiZnN0YXQoKSByZXBvcnRlZCB3cm9uZyB2YWx1
ZXMuIik7CiAJCXJldHVybjsKIAl9CiAKLQl0c3RfcmVzbShUUEFTUywgImZ1bmN0aW9uYWxpdHkg
b2YgZnN0YXQgY29ycmVjdCIpOwotfQotCi1pbnQgbWFpbihpbnQgYWMsIGNoYXIgKiphdikKLXsK
LQlpbnQgbGM7Ci0KLQl0c3RfcGFyc2Vfb3B0cyhhYywgYXYsIE5VTEwsIE5VTEwpOwotCi0Jc2V0
dXAoKTsKLQotCWZvciAobGMgPSAwOyBURVNUX0xPT1BJTkcobGMpOyBsYysrKQotCQl2ZXJpZnko
KTsKLQotCWNsZWFudXAoKTsKLQl0c3RfZXhpdCgpOworCXRzdF9yZXMoVFBBU1MsICJmc3RhdCgp
IHJlcG9ydGVkIGNvcnJlY3QgdmFsdWVzLiIpOwogfQogCiBzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQogewotCXN0cnVjdCBwYXNzd2QgKmx0cHVzZXI7Ci0JY2hhciB0c3RfYnVmZltCVUZfU0laRV07
Ci0JaW50IHdieXRlczsKLQlpbnQgd3JpdGVfbGVuID0gMDsKLQotCXRzdF9yZXF1aXJlX3Jvb3Qo
KTsKLQotCXRzdF9zaWcoTk9GT1JLLCBERUZfSEFORExFUiwgY2xlYW51cCk7Ci0KLQlsdHB1c2Vy
ID0gU0FGRV9HRVRQV05BTShOVUxMLCAibm9ib2R5Iik7Ci0JU0FGRV9TRVRVSUQoTlVMTCwgbHRw
dXNlci0+cHdfdWlkKTsKLQotCVRFU1RfUEFVU0U7Ci0KLQl0c3RfdG1wZGlyKCk7Ci0KLQl1bWFz
aygwMjIpOwotCi0JZmlsZGVzID0gU0FGRV9PUEVOKHRzdF9ybWRpciwgVEVTVEZJTEUsIE9fV1JP
TkxZIHwgT19DUkVBVCwgRklMRV9NT0RFKTsKLQotCS8qIEZpbGwgdGhlIHRlc3QgYnVmZmVyIHdp
dGggdGhlIGtub3duIGRhdGEgKi8KLQltZW1zZXQodHN0X2J1ZmYsICdhJywgQlVGX1NJWkUgLSAx
KTsKKwl1c2VyX2lkICA9IGdldHVpZCgpOworCWdyb3VwX2lkID0gZ2V0Z2lkKCk7CiAKLQkvKiBX
cml0ZSB0byB0aGUgZmlsZSAxayBkYXRhIGZyb20gdGhlIGJ1ZmZlciAqLwotCXdoaWxlICh3cml0
ZV9sZW4gPCBGSUxFX1NJWkUpIHsKLQkJaWYgKCh3Ynl0ZXMgPSB3cml0ZShmaWxkZXMsIHRzdF9i
dWZmLCBzaXplb2YodHN0X2J1ZmYpKSkgPD0gMCkKLQkJCXRzdF9icmttKFRCUk9LIHwgVEVSUk5P
LCBjbGVhbnVwLCAid3JpdGUgZmFpbGVkIik7Ci0JCWVsc2UKLQkJCXdyaXRlX2xlbiArPSB3Ynl0
ZXM7Ci0JfQorCWZpbGRlcyA9IFNBRkVfT1BFTihURVNURklMRSwgT19XUk9OTFkgfCBPX0NSRUFU
LCBGSUxFX01PREUpOwogCi0JdXNlcl9pZCA9IGdldHVpZCgpOwotCWdyb3VwX2lkID0gZ2V0Z2lk
KCk7CisJaWYgKHRzdF9maWxsX2ZpbGUoVEVTVEZJTEUsICdhJywgRklMRV9TSVpFLCAxKSkKKwkJ
dHN0X2JyayhUQlJPSywgIkNvdWxkIG5vdCBmaWxsIFRlc3RmaWxlISIpOwogfQogCiBzdGF0aWMg
dm9pZCBjbGVhbnVwKHZvaWQpCiB7Ci0JaWYgKGNsb3NlKGZpbGRlcykgPT0gLTEpCi0JCXRzdF9y
ZXNtKFRXQVJOIHwgVEVSUk5PLCAiY2xvc2UgZmFpbGVkIik7Ci0KLQl0c3Rfcm1kaXIoKTsKKwlp
ZiAoZmlsZGVzID4gMCkKKwkJU0FGRV9DTE9TRShmaWxkZXMpOwogfQorCitzdGF0aWMgc3RydWN0
IHRzdF90ZXN0IHRlc3QgPSB7CisJLnRlc3RfYWxsID0gcnVuLAorCS5zZXR1cCA9IHNldHVwLAor
CS5jbGVhbnVwID0gY2xlYW51cCwKKwkubmVlZHNfdG1wZGlyID0gMSwKK307Ci0tIAoyLjE2LjQK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
