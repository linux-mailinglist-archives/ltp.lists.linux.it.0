Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E99A29CFDC
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 14:52:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE3D03C1D23
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 14:52:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9196A3C1C6D
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:52:22 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 41C76140163B
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:52:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06A4930842AF;
 Mon, 26 Aug 2019 12:52:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDEBD600CE;
 Mon, 26 Aug 2019 12:52:18 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3C7824FDE;
 Mon, 26 Aug 2019 12:52:18 +0000 (UTC)
Date: Mon, 26 Aug 2019 08:52:18 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <456316863.8154593.1566823938723.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190826111024.19053-3-chrubis@suse.cz>
References: <20190826111024.19053-1-chrubis@suse.cz>
 <20190826111024.19053-3-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.205.130, 10.4.195.24]
Thread-Topic: Sanity check creating and updating maps
Thread-Index: YIkjwKJSJCcbaikuIaY7A5QZDlzSOg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 26 Aug 2019 12:52:19 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/4] BPF: Sanity check creating and updating
 maps
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> +
> +static const struct map_type map_types[] = {
> +	{BPF_MAP_TYPE_HASH, "hash", 8, &key8},
> +	{BPF_MAP_TYPE_ARRAY, "array", 4, &key4}
> +};
> +
> +void run(unsigned int n)
> +{
> +	int fd, i;
> +	void *key = *map_types[n].key;
> +
> +	memset(attr, 0, sizeof(*attr));
> +	attr->map_type = map_types[n].id;
> +	attr->key_size = map_types[n].key_size;
> +	attr->value_size = VAL_SZ;
> +	attr->max_entries = 1;
> +
> +	TEST(bpf(BPF_MAP_CREATE, attr, sizeof(*attr)));
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EPERM) {
> +			tst_brk(TCONF | TTERRNO,
> +				"bpf() requires CAP_SYS_ADMIN on this system");
> +		} else {
> +			tst_res(TFAIL | TTERRNO, "Failed to create %s map",
> +				map_types[n].name);
> +			return;
> +		}
> +	}
> +	tst_res(TPASS, "Created %s map", map_types[n].name);
> +	fd = TST_RET;
> +
> +	memset(attr, 0, sizeof(*attr));
> +	attr->map_fd = fd;
> +	attr->key = ptr_to_u64(key);
> +	attr->value = ptr_to_u64(val_get);
> +
> +	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
> +
> +	switch (n) {

Small nit (maybe personal preference), I'd rather make this check for
map_types.attr, as opposed to test number / some position in array.

> +	case 0:
> +		if (TST_RET != -1 || TST_ERR != ENOENT) {
> +			tst_res(TFAIL | TTERRNO,
> +				"Empty hash map lookup should fail with ENOENT");
> +		} else {
> +			tst_res(TPASS | TTERRNO, "Empty hash map lookup");
> +		}
> +	break;
> +	case 1:
> +		if (TST_RET != -1) {
> +			for (i = 0;;) {
> +				if (val_get[i] != 0) {
> +					tst_res(TFAIL,
> +						"Preallocated array map val not zero");

If we hit this TFAIL, will the loop terminate?

> +				} else if (++i >= VAL_SZ) {
> +					tst_res(TPASS,
> +						"Preallocated array map lookup");
> +					break;
> +				}
> +			}
> +		} else {
> +			tst_res(TFAIL | TERRNO, "Prellocated array map lookup");
> +		}
> +	break;
> +	}
> +
> +	memset(attr, 0, sizeof(*attr));
> +	attr->map_fd = fd;
> +	attr->key = ptr_to_u64(key);
> +	attr->value = ptr_to_u64(val_set);
> +	attr->flags = BPF_ANY;
> +
> +	TEST(bpf(BPF_MAP_UPDATE_ELEM, attr, sizeof(*attr)));
> +	if (TST_RET == -1) {
> +		tst_brk(TFAIL | TTERRNO,
> +			"Update %s map element",
> +			map_types[n].name);
> +	} else {
> +		tst_res(TPASS,
> +			"Update %s map element",
> +			map_types[n].name);
> +	}
> +
> +	memset(attr, 0, sizeof(*attr));
> +	attr->map_fd = fd;
> +	attr->key = ptr_to_u64(key);
> +	attr->value = ptr_to_u64(val_get);
> +
> +	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO,
> +			"%s map lookup missing",
> +			map_types[n].name);
> +	} else if (memcmp(val_set, val_get, (size_t) VAL_SZ)) {
> +		tst_res(TFAIL,
> +			"%s map lookup returned different value",
> +			map_types[n].name);
> +	} else {
> +		tst_res(TPASS, "%s map lookup", map_types[n].name);
> +	}
> +
> +	SAFE_CLOSE(fd);
> +}
> +
> +static void setup(void)
> +{
> +	unsigned int i;
> +
> +	memcpy(key8, "12345678", 8);
> +	memset(key4, 0, 4);
> +
> +	for (i = 0; i < VAL_SZ; i++)
> +		val_set[i] = i % 256;
> +}
> +
> +static struct tst_test test = {
> +	.tcnt = 2,

Nit, ARRAY_SIZE(map_types) ?

> +	.test = run,
> +	.setup = setup,
> +	.min_kver = "3.18",
> +	.bufs = (struct tst_buffers []) {
> +		{&key4, .size = 4},
> +		{&key8, .size = 8},
> +		{&val_set, .size = VAL_SZ},
> +		{&val_get, .size = VAL_SZ},
> +		{&attr, .size = sizeof(*attr)},
> +		{},
> +	},
> +};
> --
> 2.21.0
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
