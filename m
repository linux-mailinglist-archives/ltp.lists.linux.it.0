Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 547776FF05F
	for <lists+linux-ltp@lfdr.de>; Thu, 11 May 2023 13:04:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59A0E3CB548
	for <lists+linux-ltp@lfdr.de>; Thu, 11 May 2023 13:04:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 31EF23CB4A3
 for <ltp@lists.linux.it>; Thu, 11 May 2023 13:04:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F2DAC10000FE
 for <ltp@lists.linux.it>; Thu, 11 May 2023 13:04:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3D2F81FE16;
 Thu, 11 May 2023 11:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683803057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/OMbaD1TluGjXwIvkM91FoIW4fuwHj2sDixEPHz6nU=;
 b=hI7bW8SFADlOmAuNM957kk/uSwa5Q6V4L3rQrVJs75WiwHT/t6AR2fgeP/etLVu9m3i0S3
 wE7fAxu7ReSSrMlY9E587foPdVajrSitgL5IgelVAu83hehPjRA7np+zMhhQg++nmbKE5i
 PcgIM92K/5DIKR8JftI5cmvdqKB52/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683803057;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/OMbaD1TluGjXwIvkM91FoIW4fuwHj2sDixEPHz6nU=;
 b=39nJvLf7ZiEsa96+rjK7mi9MUnlkAHqKZn5zhjr05KOPk2rrhsutOYusjXzrvwUgQDIKcT
 pA/UaF5ZwHx3btDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28AFE138FA;
 Thu, 11 May 2023 11:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nAq6CLHLXGS9UgAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Thu, 11 May 2023 11:04:17 +0000
Message-ID: <cdd66dfb-b9a1-2a58-abe0-895def28d2ed@suse.cz>
Date: Thu, 11 May 2023 13:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it
References: <20230508134903.83591-1-liwang@redhat.com>
Content-Language: en-US
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20230508134903.83591-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugemmap32: guarantee enough memory for gigantic
 hugepage
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 08. 05. 23 15:49, Li Wang wrote:
>    To get rid of warning on ppc64le:
> 
>      hugemmap32.c:34: TWARN: Failed to close FILE
>           '/sys/kernel/mm/hugepages/hugepages-16777216kB/nr_hugepages'
>      hugemmap32.c:35: TCONF: Can't update the gigantic hugepages.
>      hugemmap32.c:69: TWARN: Failed to close FILE
>           '/sys/kernel/mm/hugepages/hugepages-16777216kB/nr_hugepages': EINVAL (22)
> 
>    # ll /sys/kernel/mm/hugepages/
>    total 0
>    drwxr-xr-x. 2 root root 0 May  4 02:02 hugepages-16384kB
>    drwxr-xr-x. 2 root root 0 May  4 02:02 hugepages-16777216kB
> 
>    # cat /proc/meminfo | grep -i Hugepagesize
>    Hugepagesize:      16384 kB
> 
>    # free -h
>                   total        used        free      shared  buff/cache   available
>    Mem:           7.4Gi       1.1Gi       992Mi        13Mi       5.9Gi       6.3Gi
>    Swap:          4.0Gi          0B       4.0Gi
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>   testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c
> index 34b322bfa..7ff23b236 100644
> --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c
> +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c
> @@ -60,6 +60,12 @@ static void setup(void)
>   		tst_brk(TCONF, "Gigantic hugepages not supported");
>   
>   	SAFE_CLOSEDIR(dir);
> +
> +	if (tst_available_mem() < (long long)hpage_size) {
> +		g_hpage_path[0] = '\0';
> +		tst_brk(TCONF, "No enough memory for gigantic hugepage reserving");
> +	}
> +
>   	SAFE_FILE_LINES_SCANF(g_hpage_path, "%d", &org_g_hpages);
>   }

I also recommend calling
SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");

It doesn't whether you do it before or after tst_available_mem() since 
caches count as available.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
