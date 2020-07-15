Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9D220AB4
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 13:07:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 919B93C2A24
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 13:07:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4F7693C1C67
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 13:07:34 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 816541A01546
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 13:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594811252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=iO4hEQrHk7iLjyxygpyETAS7orfGuntOuz03Rz8KnAc=;
 b=N1VyqGDLnItCVYpX98G1baT5z9fyGrzNp4ZSF/I72XOqf6oUIP/vza5Eo+Rc1/g/7vs3KM
 bhA+EW9zDdstW51ZV+BnJPflTCKS45tiuMyNqS+TLlK5rJTRnyDytjcKijfH7uy77oXAz9
 Z0rmCySiqct5MIUKhltV3c3VmhUQEEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214--_YKm2lUM8SgshmOVEIsag-1; Wed, 15 Jul 2020 07:07:26 -0400
X-MC-Unique: -_YKm2lUM8SgshmOVEIsag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 657F280BCAC;
 Wed, 15 Jul 2020 11:07:25 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8C07100238C;
 Wed, 15 Jul 2020 11:07:23 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: broonie@kernel.org,
	skhan@linuxfoundation.org
Date: Wed, 15 Jul 2020 13:07:11 +0200
Message-Id: <9927ed18c642db002e43afe5e36fb9c18c4f9495.1594811090.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] selftests: vdso: hash entry size on alpha,
 s390x is 8 bytes
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
Cc: linux-kernel@vger.kernel.org, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

parse_vdso.c is crashing on 5.8-rc5 s390x, because it wrongly reads
nbucket as 0:
  Program received signal SIGFPE, Arithmetic exception.
  0x0000000001000f3e in vdso_sym (version=0x1001280 "LINUX_2.6", name=0x100128a "__vdso_getcpu") at parse_vdso.c:207
  207             ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
  (gdb) p vdso_info.nbucket
  $1 = 0

Per readelf source:
  https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=binutils/readelf.c;h=2406304fe35a832ac53aa7b1a367f3f7afed4264;hb=HEAD#l10027
and objdump output hash entries are double size on 64bit s390 and alpha:
  0000000000000120 <.hash>:
   120:   00 00 00 00             .long   0x00000000
   124:   00 00 00 03             .long   0x00000003
   128:   00 00 00 00             .long   0x00000000
   12c:   00 00 00 07             .long   0x00000007
   130:   00 00 00 00             .long   0x00000000
   134:   00 00 00 01             .long   0x00000001
   138:   00 00 00 00             .long   0x00000000
   13c:   00 00 00 05             .long   0x00000005
   140:   00 00 00 00             .long   0x00000000
   144:   00 00 00 06             .long   0x00000006
	  ...
   16c:   00 00 00 02             .long   0x00000002
   170:   00 00 00 00             .long   0x00000000
   174:   00 00 00 03             .long   0x00000003
   178:   00 00 00 00             .long   0x00000000
   17c:   00 00 00 04             .long   0x00000004

Do similar check in parse_vdso.c and treat hash entries as double word.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 tools/testing/selftests/vDSO/parse_vdso.c | 48 +++++++++++++++++++----
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 413f75620a35..e23efcbd1c88 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -47,8 +47,9 @@ static struct vdso_info
 	/* Symbol table */
 	ELF(Sym) *symtab;
 	const char *symstrings;
-	ELF(Word) *bucket, *chain;
+	void *bucket, *chain;
 	ELF(Word) nbucket, nchain;
+	bool hash_ent_is_dword;
 
 	/* Version table */
 	ELF(Versym) *versym;
@@ -69,6 +70,28 @@ static unsigned long elf_hash(const unsigned char *name)
 	return h;
 }
 
+/* return value of hash table entry */
+ELF(Word) get_hash_val(void *ptr, ELF(Word) idx)
+{
+	if (vdso_info.hash_ent_is_dword) {
+		ELF(Xword) *table = ptr;
+		/* for vdso assume all values fit in Elf Word */
+		return (ELF(Word)) table[idx];
+	}
+
+	ELF(Word) *table = ptr;
+	return table[idx];
+}
+
+/* return pointer to hash table entry */
+void *get_hash_ptr(void *ptr, ELF(Word) idx)
+{
+	if (vdso_info.hash_ent_is_dword)
+		return &((ELF(Xword) *) ptr)[idx];
+
+	return &((ELF(Word) *) ptr)[idx];
+}
+
 void vdso_init_from_sysinfo_ehdr(uintptr_t base)
 {
 	size_t i;
@@ -84,6 +107,14 @@ void vdso_init_from_sysinfo_ehdr(uintptr_t base)
 		return;  /* Wrong ELF class -- check ELF_BITS */
 	}
 
+	/* 64bit s390 and alpha have hash entry size of 8 bytes */
+	if ((hdr->e_machine == EM_ALPHA
+		|| hdr->e_machine == EM_S390)
+		&& hdr->e_ident[EI_CLASS] == ELFCLASS64)
+		vdso_info.hash_ent_is_dword = true;
+	else
+		vdso_info.hash_ent_is_dword = false;
+
 	ELF(Phdr) *pt = (ELF(Phdr)*)(vdso_info.load_addr + hdr->e_phoff);
 	ELF(Dyn) *dyn = 0;
 
@@ -149,11 +180,11 @@ void vdso_init_from_sysinfo_ehdr(uintptr_t base)
 	if (!vdso_info.verdef)
 		vdso_info.versym = 0;
 
-	/* Parse the hash table header. */
-	vdso_info.nbucket = hash[0];
-	vdso_info.nchain = hash[1];
-	vdso_info.bucket = &hash[2];
-	vdso_info.chain = &hash[vdso_info.nbucket + 2];
+
+	vdso_info.nbucket = get_hash_val(hash, 0);
+	vdso_info.nchain = get_hash_val(hash, 1);
+	vdso_info.bucket = get_hash_ptr(hash, 2);
+	vdso_info.chain = get_hash_ptr(hash, vdso_info.nbucket + 2);
 
 	/* That's all we need. */
 	vdso_info.valid = true;
@@ -204,9 +235,10 @@ void *vdso_sym(const char *version, const char *name)
 		return 0;
 
 	ver_hash = elf_hash(version);
-	ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
+	ELF(Word) chain = get_hash_val(vdso_info.bucket,
+		elf_hash(name) % vdso_info.nbucket);
 
-	for (; chain != STN_UNDEF; chain = vdso_info.chain[chain]) {
+	for (; chain != STN_UNDEF; chain = get_hash_val(vdso_info.chain, chain)) {
 		ELF(Sym) *sym = &vdso_info.symtab[chain];
 
 		/* Check for a defined global or weak function w/ right name. */
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
