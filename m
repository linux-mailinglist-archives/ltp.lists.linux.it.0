Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D11F5201
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 12:13:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17F243C2E1E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 12:13:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 886593C2C67
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 12:13:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 089A2201280
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 12:13:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591784015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UScPC+Mp3EZogpTFjl3oH+l+lcM1HkRCsf9txtLZSm4=;
 b=JGFZUuSWx61hIEB/EK+FFLDXpAaQAE1L+ysXPFCUiHdasOK06+V73/uMb8nFvfWIEKchXG
 G3lBOHE3zkseUEx2DLutM2YqTDpr/owoSN9d1qisNajlsEI7uWtzYwu9ERngCKf4KFduXy
 56cKsY+GGh4O1H3cJNGyNQh9YEoX78o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-JQ_y2USdMJKPy_8eVgNQzw-1; Wed, 10 Jun 2020 06:13:31 -0400
X-MC-Unique: JQ_y2USdMJKPy_8eVgNQzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6870218A0724;
 Wed, 10 Jun 2020 10:13:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61E707F4FE;
 Wed, 10 Jun 2020 10:13:30 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31CBE1809543;
 Wed, 10 Jun 2020 10:13:30 +0000 (UTC)
Date: Wed, 10 Jun 2020 06:13:29 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1904123764.15455071.1591784009893.JavaMail.zimbra@redhat.com>
In-Reply-To: <1591767427-29383-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <828833321.15301509.1591700517554.JavaMail.zimbra@redhat.com>
 <1591767427-29383-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.4]
Thread-Topic: syscalls/ioctl_loop05: Use correct blockdev to get
 logical_block_size
Thread-Index: q71HRVjmWz3liurcK2CgfhcLZzq86g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_loop05: Use correct blockdev to
 get logical_block_size
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> 
> Using df cmd (df -T /tmp/xxxxx/test.img)to get the correct block dev.

What I had in mind was to take "df -T" as inspiration, not call it directly,
but that could work too. See notes below.

> +static void find_backing_bdpath(char *buf)
> +{
> +	char line[PATH_MAX];
> +	FILE *file;
> +
> +	file = SAFE_FOPEN("1.txt", "r");
> +
> +	while (fgets(line, sizeof(line), file) != NULL)
> +		sscanf(line, "%s", buf);

This will take the last line of output, which can be a problem as some
version align output differently. For example:

# df -T .
Filesystem           Type 1K-blocks    Used Available Use% Mounted on
/dev/mapper/vg_dhcp13579-lv_root
                     ext4  46967160 3102232  41472456   7% /

can break output into two lines.

> +	SAFE_FCLOSE(file);
> +}
> +
>  static void setup(void)
>  {
> -	int fd;
> -	struct stat buf;
> +	char buf[100];
> +	const char *const df_cmd[] = {"df", "-T", ".", NULL};
>  
>  	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
>  		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
> @@ -109,13 +122,6 @@ static void setup(void)
>  	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
>  	tst_fill_file("test.img", 0, 1024, 1024);
>  
> -	fd = SAFE_OPEN("test.img", O_RDONLY);
> -	SAFE_FSTAT(fd, &buf);
> -	SAFE_CLOSE(fd);
> -
> -	logical_block_size = buf.st_blksize;
> -	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
> -
>  	tst_attach_device(dev_path, "test.img");
>  	attach_flag = 1;
>  	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> @@ -130,13 +136,24 @@ static void setup(void)
>  	 *   size of loop is bigger than the backing device's and the loop
>  	 *   needn't transform transfer.
>  	 */
> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size),
> TST_RETVAL_EQ0);
> +	SAFE_CMD(df_cmd, "1.txt", NULL);

This could be part of find_backing_bdpath() function.

What I had in mind when I referred to df was something like:
  stat("test.img", &statbuf);
  SAFE_MKNOD("blkdev", S_IFBLK | S_IRWXU, statbuf.st_dev);
  block_devfd = SAFE_OPEN("blkdev", O_RDWR);
What do you think?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
