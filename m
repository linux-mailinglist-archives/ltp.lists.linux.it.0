Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C21A1AB9F4
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 09:29:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38A953C64CA
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 09:29:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5F8953C647B
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 09:29:25 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id F19B41A014DB
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 09:29:14 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,390,1580745600"; d="scan'208";a="89140494"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Apr 2020 15:29:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id D833049DF130
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 15:18:36 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Apr 2020 15:29:07 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 16 Apr 2020 15:29:09 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 16 Apr 2020 15:29:00 +0800
Message-ID: <1587022142-32122-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: D833049DF130.AE567
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] syscalls/pipe2_01: convert into new API
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

QWxzbywgYWRkIE9fRElSRUNUIGZsYWcgdGVzdC4gVGhpcyBmbGFnIHdhcyBpbnRyb2R1Y2VkIHNp
bmNlCmNvbW1pdCA5ODgzMDM1YWU3ZWQgKCJwaXBlczogYWRkIGEgInBhY2tldGl6ZWQgcGlwZSIg
bW9kZSBmb3Igd3JpdGluZyIpLgoKU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5q
eUBjbi5mdWppdHN1LmNvbT4KLS0tCiBpbmNsdWRlL2xhcGkvZmNudGwuaCAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDQgKwogcnVudGVzdC9zeXNjYWxscyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxIC0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlwZTIvLmdpdGlnbm9yZSB8
ICAgMSAtCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUyXzAxLmMgfCAyMzQg
KysrKysrLS0tLS0tLS0tLS0tLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3Bp
cGUyXzAyLmMgfCAxNzUgLS0tLS0tLS0tLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDY1IGluc2Vy
dGlvbnMoKyksIDM1MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUyXzAyLmMKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xh
cGkvZmNudGwuaCBiL2luY2x1ZGUvbGFwaS9mY250bC5oCmluZGV4IDI0YWE0NmUxZi4uNTc2YTE4
ZGFmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xhcGkvZmNudGwuaAorKysgYi9pbmNsdWRlL2xhcGkv
ZmNudGwuaApAQCAtOSw2ICs5LDEwIEBACiAjaW5jbHVkZSA8ZmNudGwuaD4KICNpbmNsdWRlIDxz
eXMvc29ja2V0Lmg+CiAKKyNpZm5kZWYgT19ESVJFQ1QKKyMgZGVmaW5lIE9fRElSRUNUIDA0MDAw
MAorI2VuZGlmCisKICNpZm5kZWYgT19DTE9FWEVDCiAjIGRlZmluZSBPX0NMT0VYRUMgMDIwMDAw
MDAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvcnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qvc3lzY2Fs
bHMKaW5kZXggNDQyNTRkN2RhLi43OWI2NzFkNTAgMTAwNjQ0Ci0tLSBhL3J1bnRlc3Qvc3lzY2Fs
bHMKKysrIGIvcnVudGVzdC9zeXNjYWxscwpAQCAtOTExLDcgKzkxMSw2IEBAIHBpcGUxMiBwaXBl
MTIKIHBpcGUxMyBwaXBlMTMKIAogcGlwZTJfMDEgcGlwZTJfMDEKLXBpcGUyXzAyIHBpcGUyXzAy
CiAKIHBpdm90X3Jvb3QwMSBwaXZvdF9yb290MDEKIApkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9waXBlMi8uZ2l0aWdub3JlIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9waXBlMi8uZ2l0aWdub3JlCmluZGV4IGNkMzhiYjMwOS4uNDIzNTBiYmRjIDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyLy5naXRpZ25vcmUKKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9waXBlMi8uZ2l0aWdub3JlCkBAIC0xLDIgKzEgQEAKIC9waXBl
Ml8wMQotL3BpcGUyXzAyCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3Bp
cGUyL3BpcGUyXzAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUyXzAx
LmMKaW5kZXggNWYzYWQ4ZjBmLi44NmYzZjE4ZDYgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvcGlwZTIvcGlwZTJfMDEuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3BpcGUyL3BpcGUyXzAxLmMKQEAgLTEsMTg2ICsxLDc0IEBACi0vKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIENvcHlyaWdodCAoYykgVWxyaWNo
IERyZXBwZXIgPGRyZXBwZXJAcmVkaGF0LmNvbT4gICAgICAgICAgICAgICAgICAgICAgICAgICov
Ci0vKiBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgIENvcnAu
LCAyMDA5ICAgICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyAgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yIG1vZGlmeSAgICAgICovCi0vKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSAgICAgICAqLwotLyogdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3Ig
ICAgICAgICAgKi8KLS8qIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAqLwotLyogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQg
d2lsbCBiZSB1c2VmdWwsICAgICAgICAgICAgKi8KLS8qIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgIHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZiAgICAgICAgICAgICovCi0v
KiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBT
ZWUgICAgICAgICAgICAgICAgICAqLwotLyogdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGZvciBtb3JlIGRldGFpbHMuICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICovCi0vKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSAgICAgICAgICAqLwotLyogYWxvbmcgd2l0aCB0
aGlzIHByb2dyYW07ICBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlICAgICAgICAg
ICAgICAgKi8KLS8qIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGgg
Rmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EgICAgKi8KLS8qICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICovCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwotLyoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8K
LS8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBGaWxlOiAgICAgICAgcGlwZTJfMDEuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKi8KLS8qIERlc2NyaXB0aW9uOiBUaGlzIFByb2dyYW0gdGVzdHMgdGhl
IG5ldyBzeXN0ZW0gY2FsbCBpbnRyb2R1Y2VkIGluIDIuNi4yNy4gICovCi0vKiAgICAgICAgICAg
ICAgVWxyaWNowrRzIGNvbW1lbnQgYXMgaW46ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKi8KLS8qIGh0dHA6Ly9naXQua2VybmVsLm9yZy8/cD1saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LTIuNi5naXQ7YT1jb21taXQ7aD1lZDhjYWU4YmEwMTM0OGJmZDgzMzMz
ZjQ2NDhkZDgwN2IwNGQ3ZjA4ICovCi0vKiAgICAgICAgICAgICAgc2F5czogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogVGhpcyBw
YXRjaCBpbnRyb2R1Y2VzIHRoZSBuZXcgc3lzY2FsbCBwaXBlMiB3aGljaCBpcyBsaWtlIHBpcGUg
YnV0IGl0IGFsc28gKi8KLS8qIHRha2VzIGFuIGFkZGl0aW9uYWwgcGFyYW1ldGVyIHdoaWNoIHRh
a2VzIGEgZmxhZyB2YWx1ZS4gIFRoaXMgcGF0Y2ggICAgICAgICovCi0vKiBpbXBsZW1lbnRzIHRo
ZSBoYW5kbGluZyBvZiBPX0NMT0VYRUMgZm9yIHRoZSBmbGFnLiAgSSBkaWQgbm90IGFkZCBzdXBw
b3J0ICAqLwotLyogZm9yIHRoZSBuZXcgc3lzY2FsbCBmb3IgdGhlIGFyY2hpdGVjdHVyZXMgd2hp
Y2ggaGF2ZSBhIHNwZWNpYWwgc3lzX3BpcGUgICAgKi8KLS8qIGltcGxlbWVudGF0aW9uLiAgSSB0
aGluayB0aGUgbWFpbnRhaW5lcnMgb2YgdGhvc2UgYXJjaHMgaGF2ZSB0aGUgY2hhbmNlIHRvICov
Ci0vKiBnbyB3aXRoIHRoZSB1bmlmaWVkIGltcGxlbWVudGF0aW9uIGJ1dCB0aGF0J3MgdXAgdG8g
dGhlbS4gICAgICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIFRo
ZSBpbXBsZW1lbnRhdGlvbiBpbnRyb2R1Y2VzIGRvX3BpcGVfZmxhZ3MuICBJIGRpZCB0aGF0IGlu
c3RlYWQgb2YgICAgICAgICovCi0vKiBjaGFuZ2luZyBhbGwgY2FsbGVycyBvZiBkb19waXBlIGJl
Y2F1c2Ugc29tZSBvZiB0aGUgY2FsbGVycyBhcmUgd3JpdHRlbiBpbiAqLwotLyogYXNzZW1ibGVy
LiBJIHdvdWxkIHByb2JhYmx5IHNjcmV3IHVwIGNoYW5naW5nIHRoZSBhc3NlbWJseSBjb2RlLiAg
VG8gYXZvaWQgKi8KLS8qIGJyZWFraW5nIGNvZGUgZG9fcGlwZSBpcyBub3cgYSBzbWFsbCB3cmFw
cGVyIGFyb3VuZCBkb19waXBlX2ZsYWdzLiAgT25jZSAgICovCi0vKiBhbGwgY2FsbGVycyBhcmUg
Y2hhbmdlZCBvdmVyIHRvIGRvX3BpcGVfZmxhZ3MgdGhlIG9sZCBkb19waXBlIGZ1bmN0aW9uIGNh
biAqLwotLyogYmUgcmVtb3ZlZC4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIFRoZSBmb2xsb3dpbmcgdGVzdCBtdXN0
IGJlIGFkanVzdGVkIGZvciBhcmNoaXRlY3R1cmVzIG90aGVyIHRoYW4geDg2IGFuZCAgICovCi0v
KiB4ODYtNjQgYW5kIGluIGNhc2UgdGhlIHN5c2NhbGwgbnVtYmVycyBjaGFuZ2VkLiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIFVzYWdl
OiAgPGZvciBjb21tYW5kLWxpbmU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICovCi0vKiBwaXBlMl8wMSBbLWMgbl0gWy1lXVstaSBuXSBbLUkgeF0gWy1w
IHhdIFstdF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogICAgICB3aGVyZSwg
IC1jIG4gOiBSdW4gbiBjb3BpZXMgY29uY3VycmVudGx5LiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKi8KLS8qICAgICAgICAgICAgICAtZSAgIDogVHVybiBvbiBlcnJubyBsb2dnaW5nLiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAgICAgICAgLWkgbiA6
IEV4ZWN1dGUgdGVzdCBuIHRpbWVzLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAq
LwotLyogICAgICAgICAgICAgIC1JIHggOiBFeGVjdXRlIHRlc3QgZm9yIHggc2Vjb25kcy4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICAtUCB4IDogUGF1c2Ug
Zm9yIHggc2Vjb25kcyBiZXR3ZWVuIGl0ZXJhdGlvbnMuICAgICAgICAgICAgICAgICovCi0vKiAg
ICAgICAgICAgICAgLXQgICA6IFR1cm4gb24gc3lzY2FsbCB0aW1pbmcuICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIFRvdGFsIFRl
c3RzOiAxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICovCi0vKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogVGVzdCBOYW1lOiAgIHBp
cGUyXzAxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKi8KLS8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBBdXRob3I6ICAgICAgVWxyaWNoIERy
ZXBwZXIgPGRyZXBwZXJAcmVkaGF0LmNvbT4gICAgICAgICAgICAgICAgICAgICAgICAgICAqLwot
LyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIEhpc3Rvcnk6ICAgICBDcmVhdGVkIC0gSmFuIDEz
IDIwMDkgLSBVbHJpY2ggRHJlcHBlciA8ZHJlcHBlckByZWRoYXQuY29tPiAgICovCi0vKiAgICAg
ICAgICAgICAgUG9ydGVkIHRvIExUUCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgLSBKYW4gMTMgMjAwOSAt
IFN1YnJhdGEgPHN1YnJhdGFAbGludXgudm5ldC5pYm0uY29tPiAgKi8KLS8qKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKiovCi0jaW5jbHVkZSA8ZmNudGwuaD4KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGUKKy8qCisgKiBDb3B5cmlnaHQgKGMpIFVscmljaCBEcmVwcGVyIDxk
cmVwcGVyQHJlZGhhdC5jb20+CisgKiBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5l
c3MgTWFjaGluZXMgIENvcnAuLCAyMDA5CisgKiBDb3B5cmlnaHQgKGMpIDIwMjAgRlVKSVRTVSBM
SU1JVEVELiBBbGwgcmlnaHRzIHJlc2VydmVkLgorICoKKyAqIEF1dGhvcjogVWxyaWNoIERyZXBw
ZXIgPGRyZXBwZXJAcmVkaGF0LmNvbT4KKyAqCisgKiBIaXN0b3J5OgorICogQ3JlYXRlZCAtIEph
biAxMyAyMDA5IC0gVWxyaWNoIERyZXBwZXIgPGRyZXBwZXJAcmVkaGF0LmNvbT4KKyAqIFBvcnRl
ZCB0byBMVFAgLSBKYW4gMTMgMjAwOSAtIFN1YnJhdGEgPHN1YnJhdGFAbGludXgudm5ldC5pYm0u
Y29tPgorICogQ29udmVydGVkIGludG8gbmV3IGFwaSAtIEFwcmkgMTUgMjAyMCAtIFlhbmcgWHUg
PHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+CisgKi8KKyNkZWZpbmUgX0dOVV9TT1VSQ0UK
ICNpbmNsdWRlIDxzdGRpby5oPgogI2luY2x1ZGUgPHVuaXN0ZC5oPgotI2luY2x1ZGUgPHN5cy9z
eXNjYWxsLmg+Ci0jaW5jbHVkZSA8ZXJybm8uaD4KLQotI2luY2x1ZGUgInRlc3QuaCIKICNpbmNs
dWRlICJsYXBpL2ZjbnRsLmgiCi0jaW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgotCi1jaGFyICpU
Q0lEID0gInBpcGUyXzAxIjsKLWludCB0ZXN0bm87Ci1pbnQgVFNUX1RPVEFMID0gMTsKKyNpbmNs
dWRlICJ0c3RfdGVzdC5oIgogCi0vKiBFeHRlcm4gR2xvYmFsIEZ1bmN0aW9ucyAqLwotLyoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKi8KLS8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBGdW5jdGlvbjog
ICAgY2xlYW51cCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIERlc2NyaXB0aW9uOiBQZXJm
b3JtcyBhbGwgb25lIHRpbWUgY2xlYW4gdXAgZm9yIHRoaXMgdGVzdCBvbiBzdWNjZXNzZnVsICAg
ICovCi0vKiAgICAgICAgICAgICAgY29tcGxldGlvbiwgIHByZW1hdHVyZSBleGl0IG9yICBmYWls
dXJlLiBDbG9zZXMgYWxsIHRlbXBvcmFyeSAqLwotLyogICAgICAgICAgICAgIGZpbGVzLCByZW1v
dmVzIGFsbCB0ZW1wb3JhcnkgZGlyZWN0b3JpZXMgZXhpdHMgdGhlIHRlc3Qgd2l0aCAgKi8KLS8q
ICAgICAgICAgICAgICBhcHByb3ByaWF0ZSByZXR1cm4gY29kZSBieSBjYWxsaW5nIHRzdF9leGl0
KCkgZnVuY3Rpb24uICAgICAgICovCi0vKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogSW5wdXQ6
ICAgICAgIE5vbmUuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBPdXRwdXQ6ICAgICAg
Tm9uZS4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIFJldHVybjogICAgICBPbiBmYWls
dXJlIC0gRXhpdHMgY2FsbGluZyB0c3RfZXhpdCgpLiBOb24gJzAnIHJldHVybiBjb2RlLiAgICov
Ci0vKiAgICAgICAgICAgICAgT24gc3VjY2VzcyAtIEV4aXRzIGNhbGxpbmcgdHN0X2V4aXQoKS4g
V2l0aCAnMCcgcmV0dXJuIGNvZGUuICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKiovCi12b2lkIGNsZWFudXAodm9pZCkKLXsKK3N0YXRpYyBpbnQgZmRz
WzJdOwogCi0JdHN0X3JtZGlyKCk7Ci0KLX0KK3N0YXRpYyBzdHJ1Y3QgdGNhc2UgeworCWludCBm
bGFnczsKKwlpbnQgY2hlY2tfY21kOworCWludCBjaGVja19yZWFkX3NpZGU7CisJY2hhciAqbWVz
c2FnZTsKK30gdGNhc2VzW10gPSB7CisJezAsIEZfR0VURkQsIDEsICJUZXN0IHBpcGUyIHdpdGgg
MCBmbGFnIn0sCisJe09fQ0xPRVhFQywgRl9HRVRGRCwgMSwgIlRlc3QgcGlwZTIgdXNpbmcgT19D
TE9FWEVDIGZsYWcifSwKKwkvKgorCSAqIEl0IG1heSBnZXQgRUlOVkFMIGVycm9yIG9uIG9sZGVy
IGtlcm5lbCBiZWNhdXNlIHRoaXMgZmxhZyB3YXMKKwkgKiBpbnRyb2R1Y2VkIHNpbmNlIGtlcm5l
bCAzLjQuIFdlIG9ubHkgdGVzdCBmbGFnIGluIHdyaXRlIHNpZGUKKwkgKiBiZWNhdXNlIHRoaXMg
ZmxhZyB3YXMgdXNlZCB0byBtYWtlIHBpcGUgYnVmZmVyIG1hcmtlZCB3aXRoIHRoZQorCSAqIFBJ
UEVfQlVGX0ZMQUdfUEFDS0VUIGZsYWcuIEluIHJlYWQgc2lkZSwga2VybmVsIGFsc28gY2hlY2sg
YnVmZmVyCisJICogZmxhZyBpbnN0ZWFkIG9mIE9fRElSRUNULiBTbyBpdCBtYWtlIG5vIHNlbnNl
IHRvIGNoZWNrIHRoaXMgZmxhZworCSAqIGluIGZkc1swXS4KKwkgKi8KKwl7T19ESVJFQ1QsIEZf
R0VURkwsIDAsICJUZXN0IHBpcGUyIHVzaW5nIE9fRElSRUNUIGZsYWcifSwKKwl7T19OT05CTE9D
SywgRl9HRVRGTCwgMSwgIlRlc3QgcGlwZTIgdXNpbmcgT19OT05CTE9DSyBmbGFnIn0sCit9Owog
Ci0vKiBMb2NhbCAgRnVuY3Rpb25zICovCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwotLyogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKi8KLS8qIEZ1bmN0aW9uOiAgICBzZXR1cCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAqLwotLyogRGVzY3JpcHRpb246IFBlcmZvcm1zIGFsbCBvbmUgdGltZSBzZXR1cCBm
b3IgdGhpcyB0ZXN0LiBUaGlzIGZ1bmN0aW9uIGlzICAgKi8KLS8qICAgICAgICAgICAgICB0eXBp
Y2FsbHkgdXNlZCB0byBjYXB0dXJlIHNpZ25hbHMsIGNyZWF0ZSB0ZW1wb3JhcnkgZGlycyAgICAg
ICovCi0vKiAgICAgICAgICAgICAgYW5kIHRlbXBvcmFyeSBmaWxlcyB0aGF0IG1heSBiZSB1c2Vk
IGluIHRoZSBjb3Vyc2Ugb2YgdGhpcyAgICAqLwotLyogICAgICAgICAgICAgIHRlc3QuICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8q
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICovCi0vKiBJbnB1dDogICAgICAgTm9uZS4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKi8KLS8qIE91dHB1dDogICAgICBOb25lLiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAqLwotLyogUmV0dXJuOiAgICAgIE9uIGZhaWx1cmUgLSBFeGl0cyBieSBjYWxsaW5nIGNs
ZWFudXAoKS4gICAgICAgICAgICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICBPbiBzdWNj
ZXNzIC0gcmV0dXJucyAwLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICov
Ci0vKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAqLwotLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KLXZvaWQg
c2V0dXAodm9pZCkKK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKIHsKLQkvKiBDYXB0dXJlIHNp
Z25hbHMgaWYgYW55ICovCi0JLyogQ3JlYXRlIHRlbXBvcmFyeSBkaXJlY3RvcmllcyAqLwotCVRF
U1RfUEFVU0U7Ci0JdHN0X3RtcGRpcigpOworCWlmIChmZHNbMF0gPiAwKQorCQlTQUZFX0NMT1NF
KGZkc1swXSk7CisJaWYgKGZkc1sxXSA+IDEpCisJCVNBRkVfQ0xPU0UoZmRzWzFdKTsKIH0KIAot
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK3N0YXRpYyB2b2lkIHZlcmlmeV9waXBl
Mih1bnNpZ25lZCBpbnQgbikKIHsKLQlpbnQgZmRbMl0sIGksIGNvZTsKLQlpbnQgbGM7CisJc3Ry
dWN0IHRjYXNlICp0YyA9ICZ0Y2FzZXNbbl07CisJaW50IGdldF9mbGFnID0gMCwgaSA9IDA7CiAK
LQl0c3RfcGFyc2Vfb3B0cyhhcmdjLCBhcmd2LCBOVUxMLCBOVUxMKTsKLQlpZiAoKHRzdF9rdmVy
Y21wKDIsIDYsIDI3KSkgPCAwKSB7Ci0JCXRzdF9icmttKFRDT05GLAotCQkJIE5VTEwsCi0JCQkg
IlRoaXMgdGVzdCBjYW4gb25seSBydW4gb24ga2VybmVscyB0aGF0IGFyZSAyLjYuMjcgYW5kIGhp
Z2hlciIpOworCXRzdF9yZXMoVElORk8sICIlcyAiLCB0Yy0+bWVzc2FnZSk7CisJU0FGRV9QSVBF
MihmZHMsIHRjLT5mbGFncyk7CisJZm9yIChpID0gMDsgaSA8IDI7IGkrKykgeworCQlpZiAoaSA9
PSAwICYmICF0Yy0+Y2hlY2tfcmVhZF9zaWRlKQorCQkJY29udGludWU7CisJCWdldF9mbGFnID0g
U0FGRV9GQ05UTChmZHNbaV0sIHRjLT5jaGVja19jbWQpOworCQlpZiAoKGdldF9mbGFnICYmIHRj
LT5mbGFncykgfHwgKHRjLT5mbGFncyA9PSBnZXRfZmxhZykpCisJCQl0c3RfcmVzKFRQQVNTLCAi
cGlwZTIgZmRzWyVkXSBnZXRzIGV4cGVjdGVkIGZsYWcoJWQpIiwgaSwgdGMtPmZsYWdzKTsKKwkJ
ZWxzZQorCQkJdHN0X3JlcyhURkFJTCwgInBpcGUyIGZkc1slZF0gZG9lc24ndCBnZXQgZXhwZWN0
ZWQgZmxhZyglZCksIGdldCBmbGFnKCVkKSIsCisJCQkJCWksIHRjLT5mbGFncywgZ2V0X2ZsYWcp
OwogCX0KLQlzZXR1cCgpOwotCi0JZm9yIChsYyA9IDA7IFRFU1RfTE9PUElORyhsYyk7ICsrbGMp
IHsKLQkJdHN0X2NvdW50ID0gMDsKLQkJZm9yICh0ZXN0bm8gPSAwOyB0ZXN0bm8gPCBUU1RfVE9U
QUw7ICsrdGVzdG5vKSB7Ci0JCQlpZiAobHRwX3N5c2NhbGwoX19OUl9waXBlMiwgZmQsIDApICE9
IDApIHsKLQkJCQl0c3RfYnJrbShURkFJTCwgY2xlYW51cCwgInBpcGUyKDApIGZhaWxlZCIpOwot
CQkJfQotCQkJZm9yIChpID0gMDsgaSA8IDI7ICsraSkgewotCQkJCWNvZSA9IGZjbnRsKGZkW2ld
LCBGX0dFVEZEKTsKLQkJCQlpZiAoY29lID09IC0xKSB7Ci0JCQkJCXRzdF9icmttKFRCUk9LLCBj
bGVhbnVwLAotCQkJCQkJICJmY250bCBmYWlsZWQiKTsKLQkJCQl9Ci0JCQkJaWYgKGNvZSAmIEZE
X0NMT0VYRUMpIHsKLQkJCQkJdHN0X2Jya20oVEZBSUwsCi0JCQkJCQkgY2xlYW51cCwgInBpcGUy
KDApIHNldCBjbG9zZS1vbi1leGl0IGZvciBmZFslZF0iLAotCQkJCQkJIGkpOwotCQkJCX0KLQkJ
CX0KLQkJCWNsb3NlKGZkWzBdKTsKLQkJCWNsb3NlKGZkWzFdKTsKLQotCQkJaWYgKGx0cF9zeXNj
YWxsKF9fTlJfcGlwZTIsIGZkLCBPX0NMT0VYRUMpICE9IDApIHsKLQkJCQl0c3RfYnJrbShURkFJ
TCwgY2xlYW51cCwKLQkJCQkJICJwaXBlMihPX0NMT0VYRUMpIGZhaWxlZCIpOwotCQkJfQotCQkJ
Zm9yIChpID0gMDsgaSA8IDI7ICsraSkgewotCQkJCWNvZSA9IGZjbnRsKGZkW2ldLCBGX0dFVEZE
KTsKLQkJCQlpZiAoY29lID09IC0xKSB7Ci0JCQkJCXRzdF9icmttKFRCUk9LLCBjbGVhbnVwLAot
CQkJCQkJICJmY250bCBmYWlsZWQiKTsKLQkJCQl9Ci0JCQkJaWYgKChjb2UgJiBGRF9DTE9FWEVD
KSA9PSAwKSB7Ci0JCQkJCXRzdF9icmttKFRGQUlMLAotCQkJCQkJIGNsZWFudXAsICJwaXBlMihP
X0NMT0VYRUMpIGRvZXMgbm90IHNldCBjbG9zZS1vbi1leGl0IGZvciBmZFslZF0iLAotCQkJCQkJ
IGkpOwotCQkJCX0KLQkJCX0KLQkJCWNsb3NlKGZkWzBdKTsKLQkJCWNsb3NlKGZkWzFdKTsKLQkJ
CXRzdF9yZXNtKFRQQVNTLCAicGlwZTIoT19DTE9FWEVDKSBQQVNTRUQiKTsKLQkJCWNsZWFudXAo
KTsKLQkJfQotCX0KLQl0c3RfZXhpdCgpOworCWNsZWFudXAoKTsKIH0KKworc3RhdGljIHN0cnVj
dCB0c3RfdGVzdCB0ZXN0ID0geworCS50Y250ID0gQVJSQVlfU0laRSh0Y2FzZXMpLAorCS50ZXN0
ID0gdmVyaWZ5X3BpcGUyLAorCS5jbGVhbnVwID0gY2xlYW51cCwKK307CmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUyXzAyLmMgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUyXzAyLmMKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDM5ZjAyZmY4Yy4uMDAwMDAwMDAwCi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
cGlwZTIvcGlwZTJfMDIuYworKysgL2Rldi9udWxsCkBAIC0xLDE3NSArMCwwIEBACi0vKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIENvcHlyaWdodCAo
YykgVWxyaWNoIERyZXBwZXIgPGRyZXBwZXJAcmVkaGF0LmNvbT4gICAgICAgICAgICAgICAgICAg
ICAgICAgICovCi0vKiBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGlu
ZXMgIENvcnAuLCAyMDA5ICAgICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ki8KLS8qIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyAgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yIG1vZGlmeSAgICAgICovCi0vKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSAgICAgICAqLwotLyog
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGlj
ZW5zZSwgb3IgICAgICAgICAgKi8KLS8qIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNp
b24uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAqLwotLyogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsICAgICAgICAgICAgKi8KLS8qIGJ1dCBXSVRIT1VUIEFO
WSBXQVJSQU5UWTsgIHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZiAgICAgICAg
ICAgICovCi0vKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBV
UlBPU0UuICBTZWUgICAgICAgICAgICAgICAgICAqLwotLyogdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8K
LS8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBj
b3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSAgICAgICAgICAqLwotLyogYWxv
bmcgd2l0aCB0aGlzIHByb2dyYW07ICBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJl
ICAgICAgICAgICAgICAgKi8KLS8qIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVl
dCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EgICAgKi8KLS8qICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICovCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwotLyoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKi8KLS8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBGaWxlOiAgICAgICAgcGlwZTJf
MDIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAq
LwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIERlc2NyaXB0aW9uOiBUaGlzIFByb2dyYW0g
dGVzdHMgdGhlIG5ldyBzeXN0ZW0gY2FsbCBpbnRyb2R1Y2VkIGluIDIuNi4yNy4gICovCi0vKiAg
ICAgICAgICAgICAgVWxyaWNowrRzIGNvbW1lbnQgYXMgaW46ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKi8KLS8qIGh0dHA6Ly9naXQua2VybmVsLm9yZy8/cD1saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LTIuNi5naXQ7YT1jb21taXQ7aD1iZTYxYTg2ZDcyMzdk
ZDgwNTEwNjE1ZjM4YWUyMWQ2ZTFlOTg2NjBjICovCi0vKiB3aGljaCBzYXlzOiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwot
LyogVGhpcyBwYXRjaCBhZGRzIE9fTk9OQkxPQ0sgc3VwcG9ydCB0byBwaXBlMi4gIEl0IGlzIG1p
bmltYWxseSBtb3JlIGludm9sdmVkKi8KLS8qIHRoYW4gdGhlIHBhdGNoZXMgZm9yIGV2ZW50ZmQg
ZXQuYWwgYnV0IHN0aWxsIHRyaXZpYWwuICBUaGUgaW50ZXJmYWNlcyBvZiAgICovCi0vKiB0aGUg
Y3JlYXRlX3dyaXRlX3BpcGUgYW5kIGNyZWF0ZV9yZWFkX3BpcGUgaGVscGVyIGZ1bmN0aW9ucyB3
ZXJlIGNoYW5nZWQgICAqLwotLyogYW5kIHRoZSBvbmUgb3RoZXIgY2FsbGVyIGFzIHdlbGwuICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIFRoZSBmb2xsb3dp
bmcgdGVzdCBtdXN0IGJlIGFkanVzdGVkIGZvciBhcmNoaXRlY3R1cmVzIG90aGVyIHRoYW4geDg2
IGFuZCAgICovCi0vKiB4ODYtNjQgYW5kIGluIGNhc2UgdGhlIHN5c2NhbGwgbnVtYmVycyBjaGFu
Z2VkLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ki8KLS8qIFVzYWdlOiAgPGZvciBjb21tYW5kLWxpbmU+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBwaXBlMl8wMiBbLWMgbl0gWy1lXVstaSBu
XSBbLUkgeF0gWy1wIHhdIFstdF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyog
ICAgICB3aGVyZSwgIC1jIG4gOiBSdW4gbiBjb3BpZXMgY29uY3VycmVudGx5LiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICAtZSAgIDogVHVybiBvbiBlcnJu
byBsb2dnaW5nLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAg
ICAgICAgLWkgbiA6IEV4ZWN1dGUgdGVzdCBuIHRpbWVzLiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgIC1JIHggOiBFeGVjdXRlIHRlc3QgZm9yIHgg
c2Vjb25kcy4gICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICAt
UCB4IDogUGF1c2UgZm9yIHggc2Vjb25kcyBiZXR3ZWVuIGl0ZXJhdGlvbnMuICAgICAgICAgICAg
ICAgICovCi0vKiAgICAgICAgICAgICAgLXQgICA6IFR1cm4gb24gc3lzY2FsbCB0aW1pbmcuICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8K
LS8qIFRvdGFsIFRlc3RzOiAxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogVGVz
dCBOYW1lOiAgIHBpcGUyXzAyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBBdXRob3I6ICAg
ICAgVWxyaWNoIERyZXBwZXIgPGRyZXBwZXJAcmVkaGF0LmNvbT4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIEhpc3Rvcnk6ICAgICBDcmVh
dGVkIC0gSmFuIDEzIDIwMDkgLSBVbHJpY2ggRHJlcHBlciA8ZHJlcHBlckByZWRoYXQuY29tPiAg
ICovCi0vKiAgICAgICAgICAgICAgUG9ydGVkIHRvIExUUCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgLSBK
YW4gMTMgMjAwOSAtIFN1YnJhdGEgPHN1YnJhdGFAbGludXgudm5ldC5pYm0uY29tPiAgKi8KLS8q
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKiovCi0jaW5jbHVkZSA8ZmNudGwuaD4KLSNpbmNsdWRlIDxzdGRp
by5oPgotI2luY2x1ZGUgPHVuaXN0ZC5oPgotI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+Ci0jaW5j
bHVkZSA8ZXJybm8uaD4KLQotI2luY2x1ZGUgInRlc3QuaCIKLSNpbmNsdWRlICJsYXBpL2ZjbnRs
LmgiCi0jaW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgotCi1jaGFyICpUQ0lEID0gInBpcGUyXzAy
IjsKLWludCB0ZXN0bm87Ci1pbnQgVFNUX1RPVEFMID0gMTsKLQotLyogRXh0ZXJuIEdsb2JhbCBG
dW5jdGlvbnMgKi8KLS8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCi0vKiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAqLwotLyogRnVuY3Rpb246ICAgIGNsZWFudXAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0v
KiBEZXNjcmlwdGlvbjogUGVyZm9ybXMgYWxsIG9uZSB0aW1lIGNsZWFuIHVwIGZvciB0aGlzIHRl
c3Qgb24gc3VjY2Vzc2Z1bCAgICAqLwotLyogICAgICAgICAgICAgIGNvbXBsZXRpb24sICBwcmVt
YXR1cmUgZXhpdCBvciAgZmFpbHVyZS4gQ2xvc2VzIGFsbCB0ZW1wb3JhcnkgKi8KLS8qICAgICAg
ICAgICAgICBmaWxlcywgcmVtb3ZlcyBhbGwgdGVtcG9yYXJ5IGRpcmVjdG9yaWVzIGV4aXRzIHRo
ZSB0ZXN0IHdpdGggICovCi0vKiAgICAgICAgICAgICAgYXBwcm9wcmlhdGUgcmV0dXJuIGNvZGUg
YnkgY2FsbGluZyB0c3RfZXhpdCgpIGZ1bmN0aW9uLiAgICAgICAqLwotLyogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKi8KLS8qIElucHV0OiAgICAgICBOb25lLiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAq
LwotLyogT3V0cHV0OiAgICAgIE5vbmUuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBS
ZXR1cm46ICAgICAgT24gZmFpbHVyZSAtIEV4aXRzIGNhbGxpbmcgdHN0X2V4aXQoKS4gTm9uICcw
JyByZXR1cm4gY29kZS4gICAqLwotLyogICAgICAgICAgICAgIE9uIHN1Y2Nlc3MgLSBFeGl0cyBj
YWxsaW5nIHRzdF9leGl0KCkuIFdpdGggJzAnIHJldHVybiBjb2RlLiAgKi8KLS8qICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICovCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwotdm9pZCBjbGVhbnVwKHZvaWQp
Ci17Ci0KLQl0c3Rfcm1kaXIoKTsKLQotfQotCi0vKiBMb2NhbCAgRnVuY3Rpb25zICovCi0vKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIEZ1bmN0aW9u
OiAgICBzZXR1cCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICovCi0vKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogRGVzY3JpcHRpb246IFBl
cmZvcm1zIGFsbCBvbmUgdGltZSBzZXR1cCBmb3IgdGhpcyB0ZXN0LiBUaGlzIGZ1bmN0aW9uIGlz
ICAgKi8KLS8qICAgICAgICAgICAgICB0eXBpY2FsbHkgdXNlZCB0byBjYXB0dXJlIHNpZ25hbHMs
IGNyZWF0ZSB0ZW1wb3JhcnkgZGlycyAgICAgICovCi0vKiAgICAgICAgICAgICAgYW5kIHRlbXBv
cmFyeSBmaWxlcyB0aGF0IG1heSBiZSB1c2VkIGluIHRoZSBjb3Vyc2Ugb2YgdGhpcyAgICAqLwot
LyogICAgICAgICAgICAgIHRlc3QuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKi8KLS8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiBJbnB1
dDogICAgICAgTm9uZS4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqLwotLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KLS8qIE91dHB1dDogICAg
ICBOb25lLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICovCi0vKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyogUmV0dXJuOiAgICAgIE9uIGZh
aWx1cmUgLSBFeGl0cyBieSBjYWxsaW5nIGNsZWFudXAoKS4gICAgICAgICAgICAgICAgICAgICAg
Ki8KLS8qICAgICAgICAgICAgICBPbiBzdWNjZXNzIC0gcmV0dXJucyAwLiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICovCi0vKiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotLyoq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKi8KLXZvaWQgc2V0dXAodm9pZCkKLXsKLQkvKiBDYXB0dXJlIHNp
Z25hbHMgaWYgYW55ICovCi0JLyogQ3JlYXRlIHRlbXBvcmFyeSBkaXJlY3RvcmllcyAqLwotCVRF
U1RfUEFVU0U7Ci0JdHN0X3RtcGRpcigpOwotfQotCi1pbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
YXJndltdKQotewotCWludCBmZHNbMl0sIGZsLCBpOwotCWludCBsYzsKLQotCXRzdF9wYXJzZV9v
cHRzKGFyZ2MsIGFyZ3YsIE5VTEwsIE5VTEwpOwotCWlmICgodHN0X2t2ZXJjbXAoMiwgNiwgMjcp
KSA8IDApIHsKLQkJdHN0X2Jya20oVENPTkYsCi0JCQkgTlVMTCwKLQkJCSAiVGhpcyB0ZXN0IGNh
biBvbmx5IHJ1biBvbiBrZXJuZWxzIHRoYXQgYXJlIDIuNi4yNyBhbmQgaGlnaGVyIik7Ci0JfQot
CXNldHVwKCk7Ci0KLQlmb3IgKGxjID0gMDsgVEVTVF9MT09QSU5HKGxjKTsgKytsYykgewotCQl0
c3RfY291bnQgPSAwOwotCQlmb3IgKHRlc3RubyA9IDA7IHRlc3RubyA8IFRTVF9UT1RBTDsgKyt0
ZXN0bm8pIHsKLQkJCWlmIChsdHBfc3lzY2FsbChfX05SX3BpcGUyLCBmZHMsIDApID09IC0xKSB7
Ci0JCQkJdHN0X2Jya20oVEZBSUwsIGNsZWFudXAsICJwaXBlMigwKSBmYWlsZWQiKTsKLQkJCX0K
LQkJCWZvciAoaSA9IDA7IGkgPCAyOyArK2kpIHsKLQkJCQlmbCA9IGZjbnRsKGZkc1tpXSwgRl9H
RVRGTCk7Ci0JCQkJaWYgKGZsID09IC0xKSB7Ci0JCQkJCXRzdF9icmttKFRCUk9LLCBjbGVhbnVw
LAotCQkJCQkJICJmY250bCBmYWlsZWQiKTsKLQkJCQl9Ci0JCQkJaWYgKGZsICYgT19OT05CTE9D
SykgewotCQkJCQl0c3RfYnJrbShURkFJTCwKLQkJCQkJCSBjbGVhbnVwLCAicGlwZTIoMCkgc2V0
IG5vbi1ibG9ja2luZyBtb2RlIGZvciBmZHNbJWRdIiwKLQkJCQkJCSBpKTsKLQkJCQl9Ci0JCQkJ
Y2xvc2UoZmRzW2ldKTsKLQkJCX0KLQotCQkJaWYgKGx0cF9zeXNjYWxsKF9fTlJfcGlwZTIsIGZk
cywgT19OT05CTE9DSykgPT0gLTEpIHsKLQkJCQl0c3RfYnJrbShURkFJTCwgY2xlYW51cCwKLQkJ
CQkJICJwaXBlMihPX05PTkJMT0NLKSBmYWlsZWQiKTsKLQkJCX0KLQkJCWZvciAoaSA9IDA7IGkg
PCAyOyArK2kpIHsKLQkJCQlmbCA9IGZjbnRsKGZkc1tpXSwgRl9HRVRGTCk7Ci0JCQkJaWYgKGZs
ID09IC0xKSB7Ci0JCQkJCXRzdF9icmttKFRCUk9LLCBjbGVhbnVwLAotCQkJCQkJICJmY250bCBm
YWlsZWQiKTsKLQkJCQl9Ci0JCQkJaWYgKChmbCAmIE9fTk9OQkxPQ0spID09IDApIHsKLQkJCQkJ
dHN0X2Jya20oVEZBSUwsCi0JCQkJCQkgY2xlYW51cCwgInBpcGUyKE9fTk9OQkxPQ0spIGRvZXMg
bm90IHNldCBub24tYmxvY2tpbmcgbW9kZSBmb3IgZmRzWyVkXVxuIiwKLQkJCQkJCSBpKTsKLQkJ
CQl9Ci0JCQkJY2xvc2UoZmRzW2ldKTsKLQkJCX0KLQkJCXRzdF9yZXNtKFRQQVNTLCAicGlwZTIo
T19OT05CTE9DSykgUEFTU0VEIik7Ci0JCQljbGVhbnVwKCk7Ci0JCX0KLQl9Ci0JdHN0X2V4aXQo
KTsKLX0KLS0gCjIuMjMuMAoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
