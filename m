Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5136C3C94F
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 12:47:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20E873EAEC7
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 12:47:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2D3C73EA1B4
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 12:47:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A0B4914016D1
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 12:47:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 612E6AE56
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 10:47:54 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Tue, 11 Jun 2019 12:47:47 +0200
Message-Id: <20190611104747.14689-2-camann@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190611104747.14689-1-camann@suse.com>
References: <20190611104747.14689-1-camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/2] syscalls/lstat02: rewrote testcase
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

Q2xlYW5lZCB1cCBhbmQgcG9ydGVkIHRvIG5ldyBsaWJyYXJ5LgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEFtYW5uIDxjYW1hbm5Ac3VzZS5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9sc3RhdC9sc3RhdDAyLmMgfCAxODEgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgMTE1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbHN0YXQvbHN0YXQwMi5jIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sc3RhdC9sc3RhdDAyLmMKaW5kZXggNzc0ODY3MDIwLi5m
MzlmMzNiMzQgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbHN0YXQvbHN0
YXQwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbHN0YXQvbHN0YXQwMi5jCkBA
IC0xLDI0ICsxLDEyIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgogLyoKICAqICAgQ29weXJpZ2h0IChjKSBJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hp
bmVzICBDb3JwLiwgMjAwMQogICogICAwNy8yMDAxIFBvcnRlZCBieSBXYXluZSBCb3llcgotICoK
LSAqICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7ICB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5Ci0gKiAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Ci0gKiAgIHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCi0gKiAg
IChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCi0gKgotICogICBUaGlzIHByb2dy
YW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKLSAq
ICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyAgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCi0gKiAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRS4gIFNlZQotICogICB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4KLSAqCi0gKiAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCi0gKiAgIGFsb25nIHdpdGggdGhpcyBw
cm9ncmFtOyAgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLAot
ICogICBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAy
MTEwLTEzMDEgVVNBCisgKiAgIDA2LzIwMTkgUG9ydGVkIHRvIG5ldyBsaWJyYXJ5OiBDaHJpc3Rp
YW4gQW1hbm4gPGNhbWFubkBzdXNlLmNvbT4KICAqLwogLyoKLSAqIFRlc3QgRGVzY3JpcHRpb246
Ci0gKiAgIFZlcmlmeSB0aGF0LAorICogVGhpcyB0ZXN0IHZlcmlmaWVzIHRoYXQ6CisgKgogICog
ICAxKSBsc3RhdCgyKSByZXR1cm5zIC0xIGFuZCBzZXRzIGVycm5vIHRvIEVBQ0NFUyBpZiBzZWFy
Y2ggcGVybWlzc2lvbiBpcwogICoJZGVuaWVkIG9uIGEgY29tcG9uZW50IG9mIHRoZSBwYXRoIHBy
ZWZpeC4KICAqICAgMikgbHN0YXQoMikgcmV0dXJucyAtMSBhbmQgc2V0cyBlcnJubyB0byBFTk9F
TlQgaWYgdGhlIHNwZWNpZmllZCBmaWxlCkBAIC0zMyw3MCArMjEsNjAgQEAKICAqCW1hbnkgc3lt
Ym9saWMgbGlua3MgZW5jb3VudGVyZWQgd2hpbGUgdHJhdmVyc2luZy4KICAqLwogCi0jaW5jbHVk
ZSA8c3RkaW8uaD4KLSNpbmNsdWRlIDxzdGRsaWIuaD4KLSNpbmNsdWRlIDx1bmlzdGQuaD4KLSNp
bmNsdWRlIDxmY250bC5oPgogI2luY2x1ZGUgPGVycm5vLmg+CisjaW5jbHVkZSA8cHdkLmg+Cisj
aW5jbHVkZSA8c3RkbGliLmg+CiAjaW5jbHVkZSA8c3RyaW5nLmg+Ci0jaW5jbHVkZSA8c2lnbmFs
Lmg+CisjaW5jbHVkZSA8dW5pc3RkLmg+CiAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+CiAjaW5jbHVk
ZSA8c3lzL3N0YXQuaD4KLSNpbmNsdWRlIDxzeXMvbW1hbi5oPgotI2luY2x1ZGUgPHB3ZC5oPgor
I2luY2x1ZGUgInRzdF90ZXN0LmgiCiAKLSNpbmNsdWRlICJ0ZXN0LmgiCi0jaW5jbHVkZSAic2Fm
ZV9tYWNyb3MuaCIKLQotI2RlZmluZSBNT0RFX1JXWAlTX0lSV1hVIHwgU19JUldYRyB8IFNfSVJX
WE8KLSNkZWZpbmUgRklMRV9NT0RFCVNfSVJVU1IgfCBTX0lXVVNSIHwgU19JUkdSUCB8IFNfSVJP
VEgKKyNkZWZpbmUgTU9ERV9SV1gJMDc3NworI2RlZmluZSBNT0RFX1JXMAkwNjY2CiAjZGVmaW5l
IFRFU1RfRElSCSJ0ZXN0X2RpciIKLSNkZWZpbmUgVEVTVF9FQUNDRVMJVEVTVF9ESVIiL3Rlc3Rf
ZWFjY2VzIgotI2RlZmluZSBURVNUX0VOT0VOVAkiIgotI2RlZmluZSBURVNUX0VOT1RESVIJInRl
c3RfZmlsZS90ZXN0X2Vub3RkaXIiCisjZGVmaW5lIFRFU1RfRklMRQkidGVzdF9maWxlIgorCiAj
ZGVmaW5lIFRFU1RfRUxPT1AJIi90ZXN0X2Vsb29wIgorI2RlZmluZSBURVNUX0VOT0VOVAkiIgor
I2RlZmluZSBURVNUX0VBQ0NFUwlURVNUX0RJUiIvdGVzdF9lYWNjZXMiCisjZGVmaW5lIFRFU1Rf
RU5PVERJUglURVNUX0ZJTEUiL3Rlc3RfZW5vdGRpciIKIAogc3RhdGljIGNoYXIgbG9uZ3BhdGhu
YW1lW1BBVEhfTUFYICsgMl07Ci1zdGF0aWMgY2hhciBlbG9vcHBhdGhuYW1lW3NpemVvZihURVNU
X0VMT09QKSAqIDQzXSA9ICIuIjsKLQotc3RhdGljIHZvaWQgc2V0dXAodm9pZCk7Ci1zdGF0aWMg
dm9pZCBsc3RhdF92ZXJpZnkoaW50KTsKLXN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCk7Ci1zdGF0
aWMgdm9pZCBiYWRfYWRkcl9zZXR1cChpbnQpOworc3RhdGljIGNoYXIgZWxvb3BwYXRobmFtZVtz
aXplb2YoVEVTVF9FTE9PUCkgKiA0M107CitzdGF0aWMgc3RydWN0IHN0YXQgc3RhdF9idWY7CiAK
IHN0YXRpYyBzdHJ1Y3QgdGVzdF9jYXNlX3QgewogCWNoYXIgKnBhdGhuYW1lOwogCWludCBleHBf
ZXJybm87Ci0Jdm9pZCAoKnNldHVwKSAoKTsKIH0gdGVzdF9jYXNlc1tdID0gewotCXtURVNUX0VB
Q0NFUywgRUFDQ0VTLCBOVUxMfSwKLQl7VEVTVF9FTk9FTlQsIEVOT0VOVCwgTlVMTH0sCi0Je05V
TEwsIEVGQVVMVCwgYmFkX2FkZHJfc2V0dXB9LAotCXtsb25ncGF0aG5hbWUsIEVOQU1FVE9PTE9O
RywgTlVMTH0sCi0Je1RFU1RfRU5PVERJUiwgRU5PVERJUiwgTlVMTH0sCi0Je2Vsb29wcGF0aG5h
bWUsIEVMT09QLCBOVUxMfSwKKwl7VEVTVF9FQUNDRVMsIEVBQ0NFU30sCisJe1RFU1RfRU5PRU5U
LCBFTk9FTlR9LAorCXtOVUxMLCBFRkFVTFR9LAorCXtsb25ncGF0aG5hbWUsIEVOQU1FVE9PTE9O
R30sCisJe1RFU1RfRU5PVERJUiwgRU5PVERJUn0sCisJe2Vsb29wcGF0aG5hbWUsIEVMT09QfSwK
IH07CiAKLWNoYXIgKlRDSUQgPSAibHN0YXQwMiI7Ci1pbnQgVFNUX1RPVEFMID0gQVJSQVlfU0la
RSh0ZXN0X2Nhc2VzKTsKLQotaW50IG1haW4oaW50IGFjLCBjaGFyICoqYXYpCitzdGF0aWMgdm9p
ZCBydW4odW5zaWduZWQgaW50IG4pCiB7Ci0JaW50IGxjOwotCWludCBpOworCXN0cnVjdCB0ZXN0
X2Nhc2VfdCAqdGMgPSAmdGVzdF9jYXNlc1tuXTsKIAotCXRzdF9wYXJzZV9vcHRzKGFjLCBhdiwg
TlVMTCwgTlVMTCk7CisJVEVTVChsc3RhdCh0Yy0+cGF0aG5hbWUsICZzdGF0X2J1ZikpOwogCi0J
c2V0dXAoKTsKLQotCWZvciAobGMgPSAwOyBURVNUX0xPT1BJTkcobGMpOyBsYysrKSB7Ci0JCXRz
dF9jb3VudCA9IDA7Ci0JCWZvciAoaSA9IDA7IGkgPCBUU1RfVE9UQUw7IGkrKykKLQkJCWxzdGF0
X3ZlcmlmeShpKTsKKwlpZiAoVFNUX1JFVCAhPSAtMSkgeworCQl0c3RfcmVzKFRGQUlMIHwgVFRF
UlJOTywgImxzdGF0KCkgcmV0dXJuZWQgJWxkLCBleHBlY3RlZCAtMSIsCisJCQlUU1RfUkVUKTsK
KwkJcmV0dXJuOwogCX0KIAotCWNsZWFudXAoKTsKLQl0c3RfZXhpdCgpOworCWlmICh0Yy0+ZXhw
X2Vycm5vID09IFRTVF9FUlIpIHsKKwkJdHN0X3JlcyhUUEFTUyB8IFRURVJSTk8sICJsc3RhdCgp
IGZhaWxlZCBhcyBleHBlY3RlZCIpOworCX0gZWxzZSB7CisJCXRzdF9yZXMoVEZBSUwgfCBUVEVS
Uk5PLAorCQkJImxzdGF0KCkgZmFpbGVkIHVuZXhwZWN0ZWRseTsgZXhwZWN0ZWQ6ICVzIC0gZ290
IiwKKwkJCXRzdF9zdHJlcnJubyh0Yy0+ZXhwX2Vycm5vKSk7CisJfQogfQogCiBzdGF0aWMgdm9p
ZCBzZXR1cCh2b2lkKQpAQCAtMTA0LDcxICs4Miw0NCBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQogCWludCBpOwogCXN0cnVjdCBwYXNzd2QgKmx0cHVzZXI7CiAKLQl0c3RfcmVxdWlyZV9yb290
KCk7Ci0KLQl0c3Rfc2lnKE5PRk9SSywgREVGX0hBTkRMRVIsIGNsZWFudXApOwotCi0JbHRwdXNl
ciA9IFNBRkVfR0VUUFdOQU0oY2xlYW51cCwgIm5vYm9keSIpOwotCVNBRkVfU0VURVVJRChjbGVh
bnVwLCBsdHB1c2VyLT5wd191aWQpOwotCi0JVEVTVF9QQVVTRTsKLQotCXRzdF90bXBkaXIoKTsK
LQotCVNBRkVfTUtESVIoY2xlYW51cCwgVEVTVF9ESVIsIE1PREVfUldYKTsKLQlTQUZFX1RPVUNI
KGNsZWFudXAsIFRFU1RfRUFDQ0VTLCAwNjY2LCBOVUxMKTsKLQlTQUZFX0NITU9EKGNsZWFudXAs
IFRFU1RfRElSLCBGSUxFX01PREUpOwotCi0JU0FGRV9UT1VDSChjbGVhbnVwLCAidGVzdF9maWxl
IiwgTU9ERV9SV1gsIE5VTEwpOworCS8qIERyb3AgcHJpdmlsZWdlcyBmb3IgRUFDQ0VTIHRlc3Qg
Ki8KKwlpZiAoZ2V0ZXVpZCgpID09IDApIHsKKwkJbHRwdXNlciA9IFNBRkVfR0VUUFdOQU0oIm5v
Ym9keSIpOworCQlTQUZFX1NFVEVVSUQobHRwdXNlci0+cHdfdWlkKTsKKwl9CiAKIAltZW1zZXQo
bG9uZ3BhdGhuYW1lLCAnYScsIFBBVEhfTUFYKzEpOworCWxvbmdwYXRobmFtZVtQQVRIX01BWCsx
XSA9ICdcMCc7CisKKwlTQUZFX01LRElSKFRFU1RfRElSLCBNT0RFX1JXWCk7CisJU0FGRV9UT1VD
SChURVNUX0VBQ0NFUywgTU9ERV9SV1gsIE5VTEwpOworCVNBRkVfVE9VQ0goVEVTVF9GSUxFLCBN
T0RFX1JXWCwgTlVMTCk7CisJU0FGRV9DSE1PRChURVNUX0RJUiwgTU9ERV9SVzApOwogCi0JU0FG
RV9NS0RJUihjbGVhbnVwLCAidGVzdF9lbG9vcCIsIE1PREVfUldYKTsKLQlTQUZFX1NZTUxJTkso
Y2xlYW51cCwgIi4uL3Rlc3RfZWxvb3AiLCAidGVzdF9lbG9vcC90ZXN0X2Vsb29wIik7CisJU0FG
RV9NS0RJUigidGVzdF9lbG9vcCIsIE1PREVfUldYKTsKKwlTQUZFX1NZTUxJTksoIi4uL3Rlc3Rf
ZWxvb3AiLCAidGVzdF9lbG9vcC90ZXN0X2Vsb29wIik7CiAJLyoKLQkgKiBOT1RFOiB0aGUgRUxP
T1AgdGVzdCBpcyB3cml0dGVuIGJhc2VkIG9uIHRoYXQgdGhlIGNvbnNlY3V0aXZlCi0JICogc3lt
bGlua3MgbGltaXRzIGluIGtlcm5lbCBpcyBoYXJkd2lyZWQgdG8gNDAuCisJICogTk9URTogVGhl
IEVMT09QIHRlc3QgaXMgd3JpdHRlbiBiYXNlZCBvbiB0aGUgZmFjdCB0aGF0IHRoZQorCSAqIGNv
bnNlY3V0aXZlIHN5bWxpbmtzIGxpbWl0IGluIHRoZSBrZXJuZWwgaXMgaGFyZHdpcmVkIHRvIDQw
LgogCSAqLworCWVsb29wcGF0aG5hbWVbMF0gPSAnLic7CiAJZm9yIChpID0gMDsgaSA8IDQzOyBp
KyspCiAJCXN0cmNhdChlbG9vcHBhdGhuYW1lLCBURVNUX0VMT09QKTsKLQotCWZvciAoaSA9IDA7
IGkgPCBUU1RfVE9UQUw7IGkrKykgewotCQlpZiAodGVzdF9jYXNlc1tpXS5zZXR1cCkKLQkJCXRl
c3RfY2FzZXNbaV0uc2V0dXAoaSk7Ci0JfQotfQotCi1zdGF0aWMgdm9pZCBiYWRfYWRkcl9zZXR1
cChpbnQgaSkKLXsKLQl0ZXN0X2Nhc2VzW2ldLnBhdGhuYW1lID0gdHN0X2dldF9iYWRfYWRkcihj
bGVhbnVwKTsKLX0KLQotc3RhdGljIHZvaWQgbHN0YXRfdmVyaWZ5KGludCBpKQotewotCXN0cnVj
dCBzdGF0IHN0YXRfYnVmOwotCi0JVEVTVChsc3RhdCh0ZXN0X2Nhc2VzW2ldLnBhdGhuYW1lLCAm
c3RhdF9idWYpKTsKLQotCWlmIChURVNUX1JFVFVSTiAhPSAtMSkgewotCQl0c3RfcmVzbShURkFJ
TCwgImxzdGF0KCkgcmV0dXJuZWQgJWxkLCBleHBlY3RlZCAtMSwgZXJybm89JWQiLAotCQkJIFRF
U1RfUkVUVVJOLCB0ZXN0X2Nhc2VzW2ldLmV4cF9lcnJubyk7Ci0JCXJldHVybjsKLQl9Ci0KLQlp
ZiAoVEVTVF9FUlJOTyA9PSB0ZXN0X2Nhc2VzW2ldLmV4cF9lcnJubykgewotCQl0c3RfcmVzbShU
UEFTUyB8IFRURVJSTk8sICJsc3RhdCgpIGZhaWxlZCBhcyBleHBlY3RlZCIpOwotCX0gZWxzZSB7
Ci0JCXRzdF9yZXNtKFRGQUlMIHwgVFRFUlJOTywKLQkJCSAibHN0YXQoKSBmYWlsZWQgdW5leHBl
Y3RlZGx5OyBleHBlY3RlZDogJWQgLSAlcyIsCi0JCQkgdGVzdF9jYXNlc1tpXS5leHBfZXJybm8s
Ci0JCQkgc3RyZXJyb3IodGVzdF9jYXNlc1tpXS5leHBfZXJybm8pKTsKLQl9CiB9CiAKIHN0YXRp
YyB2b2lkIGNsZWFudXAodm9pZCkKIHsKLQlpZiAoc2V0ZXVpZCgwKSkKLQkJdHN0X3Jlc20oVElO
Rk8gfCBURVJSTk8sICJGYWlsZXQgdG8gc2V0ZXVpZCgwKSBiZWZvcmUgY2xlYW51cCIpOwotCi0J
dHN0X3JtZGlyKCk7CisJU0FGRV9DSE1PRChURVNUX0RJUiwgTU9ERV9SV1gpOworCVNBRkVfVU5M
SU5LKCJ0ZXN0X2Vsb29wL3Rlc3RfZWxvb3AiKTsKKwlTQUZFX1JNRElSKCJ0ZXN0X2Vsb29wIik7
CisJU0FGRV9VTkxJTksoVEVTVF9FQUNDRVMpOworCVNBRkVfUk1ESVIoVEVTVF9ESVIpOwogfQor
CitzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLnRlc3QgPSBydW4sCisJLnRjbnQg
PSBBUlJBWV9TSVpFKHRlc3RfY2FzZXMpLAorCS5zZXR1cCA9IHNldHVwLAorCS5jbGVhbnVwID0g
Y2xlYW51cCwKKwkubmVlZHNfdG1wZGlyID0gMSwKK307Ci0tIAoyLjE2LjQKCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
