Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1DD6FC5B0
	for <lists+linux-ltp@lfdr.de>; Tue,  9 May 2023 13:58:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E8103CD6F0
	for <lists+linux-ltp@lfdr.de>; Tue,  9 May 2023 13:58:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2704D3CB7C4
 for <ltp@lists.linux.it>; Tue,  9 May 2023 13:58:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4479A60069A
 for <ltp@lists.linux.it>; Tue,  9 May 2023 13:58:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6870A1FE1B;
 Tue,  9 May 2023 11:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683633483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcwnf3VrC6DfDlBhq+2m4l7Cim918lIcH0gZeL3won8=;
 b=q+EEUq34GxVx6Kp8JRgngZBgP0ezC87C+IL0zNvmYLHvV7eLse4p8FVcT3AkOquOcVauKb
 Qu672NxqyZa+Bb9WiMj4zlTma7OUk2rgvqw+JFuvEDTPJN18m9BZvHUPv9XXvJQV3KR75Y
 gsnS+Qae2g+YeykWU9GKNvj0yxpgeSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683633483;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcwnf3VrC6DfDlBhq+2m4l7Cim918lIcH0gZeL3won8=;
 b=yYHZ37XrEoQOlVD8SDjwKLbREnJQt7Wh+xRws/pIzZps3BQEDu3GtbKHVYoXQ1xQs01+T3
 BXNKDdx1a+eMXHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55B64139B3;
 Tue,  9 May 2023 11:58:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AFznE0s1WmTQNwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 09 May 2023 11:58:03 +0000
Date: Tue, 9 May 2023 13:59:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Pengfei Xu <pengfei.xu@intel.com>
Message-ID: <ZFo1hUZCCXbfhEXY@yuki>
References: <cover.1683274510.git.pengfei.xu@intel.com>
 <efa47acd652c93a54fb66e17183524b54e561533.1683274510.git.pengfei.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efa47acd652c93a54fb66e17183524b54e561533.1683274510.git.pengfei.xu@intel.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/1] libs: libltpnuma: Fix one fake failure
 when CXL(Compute eXpress Link) node memory is not used
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
Cc: Heng Su <heng.su@intel.com>, rpalethorpe@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  
> -	if (!mem_total || !mem_used) {
> -		tst_res(TWARN, "Failed to parse '%s'", path);
> +	tst_res(TINFO,"Node%i: mem_total:%ld kB, mem_used:%ld kB", node,
> +	        mem_total, mem_used);
> +
> +	if (!mem_total) {
> +		tst_res(TWARN, "Failed to parse '%s', MemTotal is 0", path);
>  		return 0;

Why don't we use the return value from the sscanf instead?

What about:

diff --git a/libs/libltpnuma/tst_numa.c b/libs/libltpnuma/tst_numa.c
index ef4c8e879..7e7504cac 100644
--- a/libs/libltpnuma/tst_numa.c
+++ b/libs/libltpnuma/tst_numa.c
@@ -149,11 +149,19 @@ static int node_has_enough_memory(int node, size_t min_kb)
        while (fgets(buf, sizeof(buf), fp)) {
                long val;

-               if (sscanf(buf, "%*s %*i MemTotal: %li", &val) == 1)
+               if (sscanf(buf, "%*s %*i MemTotal: %li", &val) == 1) {
                        mem_total = val;
+               } else {
+                       tst_res(TWARN, "Faield to parse '%s' MemTotal", path);
+                       return 0;
+               }

-               if (sscanf(buf, "%*s %*i MemUsed: %li", &val) == 1)
+               if (sscanf(buf, "%*s %*i MemUsed: %li", &val) == 1) {
                        mem_used = val;
+               } else {
+                       tst_res(TWARN, "Faield to parse '%s' MemUsed", path);
+                       return 0;
+               }

                if (sscanf(buf, "%*s %*i FilePages: %li", &val) == 1)
                        file_pages = val;
@@ -161,10 +169,6 @@ static int node_has_enough_memory(int node, size_t min_kb)

        fclose(fp);

-       if (!mem_total || !mem_used) {
-               tst_res(TWARN, "Failed to parse '%s'", path);
-               return 0;
-       }

        mem_avail = mem_total - mem_used + (9 * file_pages)/10;


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
