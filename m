Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC75928A8D
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jul 2024 16:19:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1720189178; h=to : date :
 message-id : references : in-reply-to : content-id : mime-version :
 subject : list-id : list-unsubscribe : list-archive : list-post :
 list-help : list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=GFDzQbGoHRXRdTTZsRFddcN0WIQXZizyBn0gT4v4sVs=;
 b=CmDDcvQyPM6FjI0faqWxv2Ou2IPlOPkKYhnH4gG6ifVI0zInLk/qBGSkm5eWPoTue+z7u
 ZqQDOHm8Hs2zUUNfV44oQArwBH1br9wVb02OEZraRJT6bz+1ajlM5Pq8XGHu+V7CLtFbbfP
 lz7oXMEJDi1cfv7NrKvDRuZgFQ098PY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBC2F3D3C19
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jul 2024 16:19:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9CA503D077B
 for <ltp@lists.linux.it>; Fri,  5 Jul 2024 16:19:36 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=chuck.lever@oracle.com;
 receiver=lists.linux.it)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1E6496068CA
 for <ltp@lists.linux.it>; Fri,  5 Jul 2024 16:19:31 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465CtTe2022821;
 Fri, 5 Jul 2024 14:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=corp-2023-11-20; bh=VkYGOBBejZ0AeypoBThI/Aa2hC8NlUAIl7/yaUEZC
 x4=; b=cfheWRnYVgx7p0GZqJ0V7ZcobjfM4bVnu1POYIErvkEVsTyrLbGmTxk2G
 qVnsMk8yVi9Pkg+LVpvPMOAubpKEid3c8AyLUA9i5mrIydv0/b5c+Ipaq75WAK1f
 TNNAlVAmydk5+FpEFWLVsrPBqtwbMz9SsyEjCFGGq8ZEIlupAUNLLFWpTqmo30af
 E24mpC9GdBF0nKmcuHd/RADNpzawK65xoNlvkrionpA2GnDov4a81wzaLtQ4RLLq
 UhfYboCYx+k2wWU23hPNR28AXGyukkpCnsfGwnhnVBC9PDct7F/ui3qhxgXASs0I
 o1S+klSpSPWbcF3PHGVBJJPeBMVyg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4029vsuwbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Jul 2024 14:19:21 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 465DJ5qC035698; Fri, 5 Jul 2024 14:19:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4028qb64ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Jul 2024 14:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWM5IEWZxF2U7NhSdc0RUlbtycaocG5CaqGiixyWdlfGrzkMEGJc/6Dx+4hPpdMUGtjo2gCIaAAMjlly6QlXi+4vTQz1GsjpwXiL2rx5hllvjWV8SzyHQnmQ7Ge5eVVpRsbib0JvO/JOB/rp66MMV4rDMLfhPFpo7i8xtlPwrvkNoTMAigU8fl+JGHtJFD+gKYsRQKUGQrqseJAAESzYHyQ8wAj8ymrrh6x+T4F8RGfuwLTqmd46qqAuw9cyXzZhIxJIMjZZbJ/wGzYzw0Ie4dsmulLGjZmt66HwHars9qtUvoxjRD1XOYuKKN58DX7Gpietm4+TNsc2JTw63yXGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkYGOBBejZ0AeypoBThI/Aa2hC8NlUAIl7/yaUEZCx4=;
 b=KHX8aTTW9tvrE5RORqbocc8d6MFmnEtLC5nOn47VCAwz9kxAwUraqL1XmMF/+UsvfifKg07yKCGvRfX9p48x+Ek0XvfvUAn7wyIGisDBjFS6TPxh2qy03+ldHNrz0bNakbQTKzU4d+PVqPrx9ZFl9mS0svpVrIi4wqWNA0v4FBrBxV9X1tCSQ4TsB+gazH2SIA/M/BSJmWdVVLUehPbDIgZIDjGL+3DtM740kxM+VJmPmbRqBZy7GzVggDa+nP9pKeeFQx1kR5yxr2aIo1TuISmrcDbNvuJQ/foLHZqLkrNTzEvQo1iRxbnBYmJhtdkEZDMH8MahKiPOK+Ey+p4bWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkYGOBBejZ0AeypoBThI/Aa2hC8NlUAIl7/yaUEZCx4=;
 b=TVk69q7Z9m36z7LXv6nEdbcdmSQQvLY/GbFScmMcrlb+f0fgkVuCUhjZBzSEMgWfmGBVjy1fd8IkoHZydDpNZuj0KT0QRLBK0yMQlItgKfTHZ1pBXvfrDjQeGuSo9KB+ozA9MiFNnNj3bouG/7cTAiTTH6YL6uXCFFO//FqPfCs=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BL3PR10MB6162.namprd10.prod.outlook.com (2603:10b6:208:3bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 14:19:18 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 14:19:18 +0000
To: Calum Mackay <calum.mackay@oracle.com>, linux-stable
 <stable@vger.kernel.org>
Thread-Topic: [LTP] [PATCH 1/1] nfsstat01: Update client RPC calls for kernel
 6.9
Thread-Index: AQHazKCp5HoPbCA8x0icX5uCFQ/MP7HkDKAAgAQmtoA=
Date: Fri, 5 Jul 2024 14:19:18 +0000
Message-ID: <296EA0E6-0E72-4EA1-8B31-B025EB531F9B@oracle.com>
References: <d4b235df-4ee5-4824-9d48-e3b3c1f1f4d1@oracle.com>
 <2fc3a3fd-7433-45ba-b281-578355dca64c@oracle.com>
In-Reply-To: <2fc3a3fd-7433-45ba-b281-578355dca64c@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BL3PR10MB6162:EE_
x-ms-office365-filtering-correlation-id: f632e59d-958a-4a2d-0d42-08dc9cfd74db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Qytic1hWS3pXY0I0ekQ4bGZMUWNwQ0pjL3ZNRnlESWErdHZYdldsQzFPcm9z?=
 =?utf-8?B?Y0Z0K2hNT1FzdHd2bXd5Ulh5U1JmYWh1YlNwU2FyektDekVMZ1ZHdERPN1F1?=
 =?utf-8?B?bFMvVEp0V3FEMjZYMW52RFJseW83Z0pnMm5EdGlnLzl6TEw5dkphNHBtbXpV?=
 =?utf-8?B?WEVObHZYZkJHakx5WWUzM3pRR0t1VXlxOGlzdHZTcVBwbDVVNnhjUEZySngv?=
 =?utf-8?B?aGdUNUpGMCs5eUZTNUJ3cWFkODREMnNpOGhFU1duWkZpL3FBNkk5NkFiRlB6?=
 =?utf-8?B?S1RCR3lCTjN4UU82NHB3N1JjekZzd0lDU1A5VkJGSS82U0NoOWQ4cUJ2Ny8v?=
 =?utf-8?B?MlB3czJON25sZkQzMlFCRjN0am9oYjh2OGIxRmRqM0l5Qk9rSExVUWlZRDZB?=
 =?utf-8?B?L0s4TTlCVURSM3BBNWExTUE5V1V1MEZIRFYxM2JrSkZGcjFQdmNkNTU0Z1g4?=
 =?utf-8?B?T3RxY2hENTg3R0RpZTFCTjF6OFFPeE93VTgrQmxYdFh5MUtEMmx6TEp4NWhy?=
 =?utf-8?B?ZHhHOWs4VXhvZko4Q1hTR3l1LzdFY28rZml4OFN6cTFTU3BkWTVjd2VTQzhB?=
 =?utf-8?B?ZjB5cUFMZ1ZBaVBoY1o1ejZmYk54WkY3OHZobTV0ejNoWGp3NkVRbi9BMnpX?=
 =?utf-8?B?dTF3aFJoaUVsbmJRTDBIUzFSZllZalpObjVaS1NTWVJRQ1NxUldTdXZnVkxW?=
 =?utf-8?B?YjZlbDY0VElzTGJBd05uOTBiT3VhczNrQWNzWXUrNHd5UVUzekR1SXRrTnJx?=
 =?utf-8?B?UmZlVmJkM3NNY29oM2Evd2FQd2Voa3Bkem5nSENOdkwxQjdzNGV2Z2pVeWpD?=
 =?utf-8?B?d3ZtT3d1Y1hoaEo2azRvcFVUdURtT0FxNU5JQnNJVytLUjU1Q2l1R2U0aklp?=
 =?utf-8?B?MVhlVUFCalBKbkQvUjIyT0J1a282ak1kQ2thYzQwMlg1QlE1aVlFNXJVVXln?=
 =?utf-8?B?UWtoOWhtK09KSXFqcEFCU2JEdi9lRFZYcXdraklIWUZucXZOT1RsdTFkSDJL?=
 =?utf-8?B?UStTbm04eC9UcmJZTURBZnVPN3AvWVNETFhSRXB3a2xHNXA0ME16MlRFS29k?=
 =?utf-8?B?ODdlaUlQYzZOc2c1NVBlcUtuNUNwUGxVeTJEdFpPbTdMS2lpSVpyT0hxOGVz?=
 =?utf-8?B?TDMzK1BRSTMxeC92LzliYTB3U3lieFY5ZDZsbktoS2kvNjVIMktxR0ZTNWVz?=
 =?utf-8?B?UXhQM3VZVlVUaDdHK1d0dGRTdk5NOGFaU0JEaDk1aWpGd2UwYzdab0gwWFNr?=
 =?utf-8?B?VnR4WFJ1ZFh1R0VFWHkxMG1NMzMwMFRKaUhjc0pvZzVJMlduZkZ4dDBNaHZ0?=
 =?utf-8?B?cW1hRHpBV3ZCb2tRazJxNnpOMjFndzR0MWFZY1ZlRzRrTG9kMHBkNUVSdVhy?=
 =?utf-8?B?alU3TTVqS0RaVVNyZUllWWZibS9FNHdWTGg3WWtNai80YzYwRWgzT2VXSzZT?=
 =?utf-8?B?UVdvWm41UWJKb3NielNBRlpzUzArZnZFQmRkWlNzWW1wbkdMTVhOc2VyV0o2?=
 =?utf-8?B?VFZMSkpYWENLTSs4STZXU21YNFhaaXZCSk1GLzcxa0JWM3Y0Q3dRaWdrYnhj?=
 =?utf-8?B?RlpnSGRWQVlCdC9PWVFjdjNCN0Y1cUFqNmk0QXQ3ekZiZ1pFRlpRbVIveGRi?=
 =?utf-8?B?bmk2b1R3NkxJVEsranFkN0J2N1UzT0RkZW4vNmRQZk4wSXU2ZDZPMXVOeFdo?=
 =?utf-8?B?cFR5Z1piRFBZZTZjK0hCQ0R4bXNKcVh3anI2clJOVkRKT1BVTGZFWEZNTHVE?=
 =?utf-8?B?b1FmS21rN3d3bnFPSFV0QVZUdFAwYmFJVlVxTEpEVW4rYjBYVGNrZU9sZ1pH?=
 =?utf-8?Q?u3+37/4X7WXl0xLAPItS701yzsrz/BfrqZT9c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3hJWmpqRnl0QmdjdVNiM3lja3ZUSmJSb0ZudjN6NnFPU0JWajZQVzdmWHc1?=
 =?utf-8?B?T1hsenlUb2V3bm5kVkdpWTY4eTdHcmFkbGNBZVFWZ1FSd29haC9TRFRuVjlt?=
 =?utf-8?B?TWdpUDZwS3FuZzdSUmQ4RVM5WllYMWhqS0JwR0w0aTF5OTdjN1pZWGY2MUU1?=
 =?utf-8?B?NW5iYmc4WW9aQ2JqTlJVOUdaRkFQT0Ziczd0Qm9nc1lsYURubENrd0JrMHVr?=
 =?utf-8?B?alVydjJlZmNpYTFRSURHT3gzYnFBUXJGVHNaNU1veGdUVWtNYmxJdVIvZmIv?=
 =?utf-8?B?OHlVMm5WcTh6aW9Xdk5TWldnWUpucjJ0b2tFNVJGSGdGZVI4RWxkaWtmV1pw?=
 =?utf-8?B?a1RVT3I4ZHdIY2hkdTRkQUtZR29QRjBqVXkrZlJNRm85S1hTYWxhQWNPL2Y1?=
 =?utf-8?B?MHJqS2RqTnBxZnJxWFljMmgzS2pGVUw1S0NnL25zRDZMeks1S1pvb0ZkR1dq?=
 =?utf-8?B?MklWQm94czhxY29NSUlrOVVVQWRTRGFwd2ZlbXFqRlh2M2ZKbE9wQWRJN2d3?=
 =?utf-8?B?ZUczNG1LcU5zbGtFczB6bEFhdDIzTjUzZjlBWko1NmJyVFdMOUxNczYyNFVX?=
 =?utf-8?B?K0RqZ21WUkZKNjhLaWllc3hQclBDek51bVg1bkxGMFVYYXdydUdaWHZiclJ2?=
 =?utf-8?B?QVpRSHQ3ZUMvWFBvRkRCTVhiRGJ3WEVlYThoWmdCb2ZTTUVSNDhUT1RJMUtJ?=
 =?utf-8?B?bUlEd3gydXh2VTlzUDY2enhEdE5aQys3RitCaStMSWEycnVkS3plSHZRRUdP?=
 =?utf-8?B?c1ZlemU3bzloUVdka1VPcGZmN0s0Umg4WTNIeWY1NVpHbXZXVXphZG13azdZ?=
 =?utf-8?B?blZJMU9CZzdmc0s1MmxLTFM3RWdDbjdpZUdZMDQwSk9LMWxJcU9TSmtYZjha?=
 =?utf-8?B?RVUrUG41K2trZThWa2hRQUwrekJtdmlzU3pFQlI0a3JiM2NZbnkzeDhIRm4z?=
 =?utf-8?B?dzZEWW9JSlN4eXg1L3MyekdJSHdueUR0RkxZMExvaWlpcThjQjBIc2QwNlYw?=
 =?utf-8?B?MWRMZ0dHTEFadFVLOVJ2K053WlQ3RXVoajVXT0pJRVAycE9MczVzMXRUYmVE?=
 =?utf-8?B?d215RkVCeWVLV1VmWWhib3llWHpaQkhrWnVHUktzejVqZVNkekJRTGlYajlR?=
 =?utf-8?B?QkhJMllwUVdpK0N4cWgrS2RPb2trVk05aHpDNXRNek9wbjg3ekI5akhSWTF6?=
 =?utf-8?B?TGdzS2lDSlA0aUtwMExHMFZEa0dTS2NqWnl4aWVtdHpzME5kVXFxaVNBbEtS?=
 =?utf-8?B?NTRGSjhkZjBrK3JWRkptNGRxN1NBekw5amhTbnVCTU40akNtc0Z0KzZhdnlq?=
 =?utf-8?B?bEczZDU0Q1ZYQllPOE5GRmw4R0NrSWJrcGhIU1BtZFhpb1ZWRDIxQ3RTaitU?=
 =?utf-8?B?RmdQZjBPRDUydHVLRmJIUVNkdlZ5ZWpOaE1uUUIzblFzUStwYkFjRU9xdVRC?=
 =?utf-8?B?QU9BZ1Y4MXU1NURKcmJmWldRMzJzVlJvcXduajVoRVU1V2YrdnpLQTZBRFZh?=
 =?utf-8?B?TCtyR09xOXhBYXgwUzl1QndWL0RMbVdVSUNsYmhaVTEvZ2tzVkduU2FuK2hU?=
 =?utf-8?B?UFBNa29kTTN0azdYQTVwUkhHbCtXWUd6UzBMY1VmMWRHbjhBZWh5V0hYUC9J?=
 =?utf-8?B?VDM0QUs5azFIT2xpUTNmdTBLWXVTZnVtemQvNDBPT0VmbzdvSTkwQmpVMm0w?=
 =?utf-8?B?S1JnVEhVandUUytyalVwRytWY2orV2JkelJjVUo3SUtiOHNFRFBmeGpSSGM0?=
 =?utf-8?B?L2RrR0hrazdFUlZKbGxGNFJTd29rV29hZnJFcGpOdlhBdmZTQWVBYmtYZHdX?=
 =?utf-8?B?OXVQTE5WSWRnSUpEY05qQU95dVBibFAwQUk4emVTaG12Q2xpVUozeU9qdWtm?=
 =?utf-8?B?MjBrSGlGdEN0SEt6SkFvVWo5d3YvR0tSUWNtOUhnMkRQOEYxOTVGV1NLckxN?=
 =?utf-8?B?Z1EwMU04aGZ3SDRBaWVGV3ZBclRjUE01eEZpQ29wdmtIOXp6RFJCb01leFp0?=
 =?utf-8?B?cXlPZHFsR2phTjBTUjVaOHZabzQvcUUweDNXb25yOEo0YUlQTGFCLzF2RU1Y?=
 =?utf-8?B?UWhoZDcrdDdjV0lkd1FhdjBPSERlbmUyK2xjQ1EwV01mTGlqb0pPbFhFd25N?=
 =?utf-8?B?cmtISGg4N3pxQi94RjZhc2NoT0NaejRnTjZPd2oydDQ4SVdKcTVNMTJrU1Vm?=
 =?utf-8?B?dnc9PQ==?=
Content-ID: <040A00BAD85E6943A0E6399360C26414@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OYev1D1Bfaq+WPaQUOPqKotM6iQBYkyGlp7KsOdB1n8Y6KBeTNEXymOC4fKnJgMzRl/SF1kLscznq7yoTAyJDY349P0ESxEWs00VQPXxJEqGuLih8tB/vpBlvmWnG5VYO0l7WZj0fJH9DdVWsKQ0hz9GEnjIbYBD8QEaq6ouGdSSX+pz/Xylu33b0OvIl/eq2/826yKn7l9/PDPJgZBxSuzTlMzEWJxRvCOqfKLFcjLLhDZ0IN+p3oxAA3nyVelK6oFdHOSa80XV3IQiNnBIaTT8bpKshApKRRIj9t3vvOa0kiKTCLMmXd3sQD+CK4eWXFUW+aadrikoDAPMVKstaYhCVMsk173hxhxsEdW4oH+ZuPpzXvGZzTn++RDbZCbLs//3Xa5EW2CVJtGPIzDxo3o2JnmIcO0z7W5H0HUnt7yhDL4x1Kog19PA2ZFFZ/KRjahhgZgJmoNZeGJNvPkFtZF506bgsTtr0GsT/f6fHUdcYx+rpdD5ENxbYtWJECt/OTh0vgBG5OhdgcdV3yFsMSdl3THNTVMdQyEldyGPPKc1nFXyfRSAX8vFzgBzLGHKQv008Sm4ufGe937UcId9WiDfwEs927fL/FSHkw/OW5Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f632e59d-958a-4a2d-0d42-08dc9cfd74db
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 14:19:18.0877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +pQ0TG/W3jT4zubZTGIUCePS90uCk5bhk8h3fHVkDczJ61WUK3CR/5D5hCnql8J5xkVkzBfmg079A52DFqcMuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6162
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_10,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407050103
X-Proofpoint-GUID: nD0iTE3M5o0A7ZYQ3DxM6nYBHxVnzolh
X-Proofpoint-ORIG-GUID: nD0iTE3M5o0A7ZYQ3DxM6nYBHxVnzolh
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] nfsstat01: Update client RPC calls for kernel
 6.9
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
From: Chuck Lever III via ltp <ltp@lists.linux.it>
Reply-To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Neil Brown <neilb@suse.de>, Jeff Layton <jlayton@kernel.org>,
 Sherry Yang <sherry.yang@oracle.com>, Josef Bacik <josef@toxicpanda.com>,
 Anna Schumaker <anna@kernel.org>, Trond Myklebust <trondmy@hammerspace.com>,
 "kernel-team@fb.com" <kernel-team@fb.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

DQoNCj4gT24gSnVsIDIsIDIwMjQsIGF0IDY6NTXigK9QTSwgQ2FsdW0gTWFja2F5IDxjYWx1bS5t
YWNrYXlAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPiBUbyBjbGFyaWZ54oCmDQo+IA0KPiBPbiAw
Mi8wNy8yMDI0IDU6NTQgcG0sIENhbHVtIE1hY2theSB3cm90ZToNCj4+IGhpIFBldHIsDQo+PiBJ
IG5vdGljZWQgeW91ciBMVFAgcGF0Y2ggWzFdWzJdIHdoaWNoIGFkanVzdHMgdGhlIG5mc3N0YXQw
MSB0ZXN0IG9uIHY2Ljkga2VybmVscywgdG8gYWNjb3VudCBmb3IgSm9zZWYncyBjaGFuZ2VzIFsz
XSwgd2hpY2ggcmVzdHJpY3QgdGhlIE5GUy9SUEMgc3RhdHMgcGVyLW5hbWVzcGFjZS4NCj4+IEkg
c2VlIHRoYXQgSm9zZWYncyBjaGFuZ2VzIHdlcmUgYmFja3BvcnRlZCwgYXMgZmFyIGJhY2sgYXMg
bG9uZ3Rlcm0gdjUuNCwNCj4gDQo+IFNvcnJ5LCB0aGF0J3Mgbm90IHF1aXRlIGFjY3VyYXRlLg0K
PiANCj4gSm9zZWYncyBORlMgY2xpZW50IGNoYW5nZXMgd2VyZSBhbGwgYmFja3BvcnRlZCBmcm9t
IHY2LjksIGFzIGZhciBhcyBsb25ndGVybSB2NS40Lnk6DQo+IA0KPiAyMDU3YTQ4ZDBkZDAgc3Vu
cnBjOiBhZGQgYSBzdHJ1Y3QgcnBjX3N0YXRzIGFyZyB0byBycGNfY3JlYXRlX2FyZ3MNCj4gZDQ3
MTUxYjc5ZTMyIG5mczogZXhwb3NlIC9wcm9jL25ldC9zdW5ycGMvbmZzIGluIG5ldCBuYW1lc3Bh
Y2VzDQo+IDE1NDgwMzZlZjEyMCBuZnM6IG1ha2UgdGhlIHJwY19zdGF0IHBlciBuZXQgbmFtZXNw
YWNlDQo+IA0KPiANCj4gT2YgSm9zZWYncyBORlMgc2VydmVyIGNoYW5nZXMsIGZvdXIgd2VyZSBi
YWNrcG9ydGVkIGZyb20gdjYuOSB0byB2Ni44Og0KPiANCj4gNDE4Yjk2ODdkZWNlIHN1bnJwYzog
dXNlIHRoZSBzdHJ1Y3QgbmV0IGFzIHRoZSBzdmMgcHJvYyBwcml2YXRlDQo+IGQ5ODQxNmNjMjE1
NCBuZnNkOiByZW5hbWUgTkZTRF9ORVRfKiB0byBORlNEX1NUQVRTXyoNCj4gOTM0ODNhYzVmZWM2
IG5mc2Q6IGV4cG9zZSAvcHJvYy9uZXQvc3VucnBjL25mc2QgaW4gbmV0IG5hbWVzcGFjZXMNCj4g
NGIxNDg4NTQxMWY3IG5mc2Q6IG1ha2UgYWxsIG9mIHRoZSBuZnNkIHN0YXRzIHBlci1uZXR3b3Jr
IG5hbWVzcGFjZQ0KPiANCj4gYW5kIHRoZSBvdGhlcnMgcmVtYWluZWQgb25seSBpbiB2Ni45Og0K
PiANCj4gYWI0MmY0ZDlhMjZmIHN1bnJwYzogZG9uJ3QgY2hhbmdlIC0+c3Zfc3RhdHMgaWYgaXQg
ZG9lc24ndCBleGlzdA0KPiBhMjIxNGVkNTg4ZmIgbmZzZDogc3RvcCBzZXR0aW5nIC0+cGdfc3Rh
dHMgZm9yIHVudXNlZCBzdGF0cw0KPiBmMDk0MzIzODY3NjYgc3VucnBjOiBwYXNzIGluIHRoZSBz
dl9zdGF0cyBzdHJ1Y3QgdGhyb3VnaCBzdmNfY3JlYXRlX3Bvb2xlZA0KPiAzZjZlZjE4MmYxNDQg
c3VucnBjOiByZW1vdmUgLT5wZ19zdGF0cyBmcm9tIHN2Y19wcm9ncmFtDQo+IGU0MWVlNDRjYzZh
NCBuZnNkOiByZW1vdmUgbmZzZF9zdGF0cywgbWFrZSB0aF9jbnQgYSBnbG9iYWwgY291bnRlcg0K
PiAxNmZiOTgwOGFiMmMgbmZzZDogbWFrZSBzdmNfc3RhdCBwZXItbmV0d29yayBuYW1lc3BhY2Ug
aW5zdGVhZCBvZiBnbG9iYWwNCj4gDQo+IA0KPiANCj4gSSdtIHdvbmRlcmluZyBpZiB0aGlzIGRp
ZmZlcmVuY2UgYmV0d2VlbiBORlMgY2xpZW50LCBhbmQgTkZTIHNlcnZlciwgc3RhdCBiZWhhdmlv
dXIsIGFjcm9zcyBrZXJuZWwgdmVyc2lvbnMsIG1heSBwZXJoYXBzIGNhdXNlIHNvbWUgdXNlciBj
b25mdXNpb24/DQoNCkFzIGEgcmVmcmVzaGVyIGZvciB0aGUgc3RhYmxlIGZvbGtlbiwgSm9zZWYn
cyBjaGFuZ2VzIG1ha2UNCm5mc3N0YXRzIHNpbG8nZCwgc28gdGhleSBubyBsb25nZXIgc2hvdyBj
b3VudHMgZnJvbSB0aGUgd2hvbGUNCnN5c3RlbSwgYnV0IG9ubHkgZm9yIE5GUyBvcGVyYXRpb25z
IHJlbGF0aW5nIHRvIHRoZSBsb2NhbCBuZXQNCm5hbWVzcGFjZS4gVGhhdCBpcyBhIHN1cnByaXNp
bmcgY2hhbmdlIGZvciBzb21lIHVzZXJzLCB0b29scywNCmFuZCB0ZXN0aW5nLg0KDQpJJ20gbm90
IGNsZWFyIG9uIHdoZXRoZXIgdGhlcmUgYXJlIGFueSBydWxlcy9ndWlkZWxpbmVzIGFyb3VuZA0K
TFRTIGJhY2twb3J0cyBjYXVzaW5nIGJlaGF2aW9yIGNoYW5nZXMgdGhhdCB1c2VyIHRvb2xzLCBs
aWtlDQpuZnNzdGF0LCBtaWdodCBiZSBpbXBhY3RlZCBieS4NCg0KVGhlIGNsaWVudC1zaWRlIG5m
c3N0YXQgY2hhbmdlcyBhcmUgZnVsbHkgYmFja3BvcnRlZCB0byBhbGwNClRTIGtlcm5lbHMuIEJ1
dCBzaG91bGQgdGhleSBoYXZlIGJlZW4/DQoNClRoZSBzZXJ2ZXItc2lkZSBuZnNzdGF0IGNoYW5n
ZXMgYXBwZWFyIGluIG9ubHkgdjYuOS4gU2hvdWxkDQp0aGV5IGJlIGJhY2twb3J0ZWQgdG8gdGhl
IG90aGVyIExUUyBrZXJuZWxzLCBvciBub3Q/DQoNCg0KPj4gc28geW91ciBjaGVjayBmb3Iga2Vy
bmVsIHZlcnNpb24gIjYuOSIgaW4gdGhlIHRlc3QgbWF5IG5lZWQgdG8gYmUgYWRqdXN0ZWQsIGlm
IExUUCBpcyBpbnRlbmRlZCB0byBiZSBydW4gb24gc3RhYmxlIGtlcm5lbHM/DQo+PiBiZXN0IHdp
c2hlcywNCj4+IGNhbHVtLg0KPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2x0cC8yMDI0
MDYyMDExMTEyOS41OTQ0NDktMS1wdm9yZWxAc3VzZS5jei8NCj4+IFsyXSBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwLyBwYXRjaC8yMDI0MDYyMDExMTEyOS41OTQ0NDkt
MS1wdm9yZWxAc3VzZS5jei8NCj4+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1u
ZnMvIGNvdmVyLjE3MDgwMjY5MzEuZ2l0Lmpvc2VmQHRveGljcGFuZGEuY29tLw0KDQotLQ0KQ2h1
Y2sgTGV2ZXINCg0KDQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
